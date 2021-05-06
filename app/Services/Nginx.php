<?php

namespace App\Services;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;

class Nginx
{
    public static function createConfigForSite($siteName)
    {
        self::createBaseConfig($siteName);
        self::createSslConfig($siteName);
    }

    public static function reload()
    {
        (new Shell)->execute('systemctl reload nginx');
    }

    private static function createBaseConfig($siteName)
    {
        $content = File::get(base_path('templates/nginx/site-config'));

        $content = Str::of($content)
            ->replace("{{ siteName }}", $siteName);

        File::put("/etc/nginx/sites-available/{$siteName}", $content);

        File::link("/etc/nginx/sites-available/{$siteName}", "/etc/nginx/sites-enabled/{$siteName}");
    }

    private static function createSslConfig($siteName)
    {
        File::makeDirectory("/etc/nginx/jarvis/{$siteName}/before/", recursive: true);

        $content = File::get(base_path('templates/nginx/ssl-config'));

        $content = Str::of($content)
            ->replace("{{ siteName }}", $siteName);

        File::put("/etc/nginx/jarvis/{$siteName}/before/ssl-config", $content);
    }
}