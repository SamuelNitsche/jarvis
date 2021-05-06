<?php

namespace App\Services;

use SplFileInfo;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;

class Site
{
    public static function create($siteName)
    {
        Nginx::createConfigForSite($siteName);

        (new Shell)->execute("mkdir -p /home/jarvis/{$siteName}/public");

        File::copy(base_path('templates/nginx/index.php'), "/home/jarvis/{$siteName}/public/index.php");
    }

    public static function secure($siteName, $dry)
    {
        Certbot::requestCertificateForDomain($siteName, $dry);

        Site::enableSslConfig($siteName);
    }

    public static function enableSslConfig($siteName)
    {
        $configFile = File::get("/etc/nginx/sites-enabled/{$siteName}");
        $configFile = Str::of($configFile)
            ->replaceMatches('/# (include .*ssl-config;)/', function ($match) {
                return $match[1];
            });
        File::put("/etc/nginx/sites-enabled/{$siteName}", $configFile);

        Nginx::reload();
    }

    public static function exists($siteName): bool
    {
        return File::exists("/etc/nginx/sites-enabled/{$siteName}");
    }

    public static function all(): array
    {
        return collect(File::allFiles('/etc/nginx/sites-enabled'))
            ->map(function (SplFileInfo $fileInfo) {
                return $fileInfo->getFilename();
            })
            ->reject(function ($siteName) {
                return in_array($siteName, ['catch-all', 'localhost']);
            })
            ->toArray();
    }
}