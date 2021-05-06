<?php

namespace App\Services;

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
    }

    public static function exists($siteName): bool
    {
        return File::exists("/etc/nginx/sites-enabled/{$siteName}");
    }
}