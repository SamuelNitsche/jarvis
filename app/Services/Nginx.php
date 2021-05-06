<?php

namespace App\Services;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;

class Nginx
{
    public static function createConfigForSite($siteName)
    {
        $content = File::get(base_path('templates/nginx/site-config'));

        $content = Str::of($content)
            ->replace("{{ siteName }}", $siteName);

        File::put("/etc/nginx/sites-available/{$siteName}", $content);

        File::link("/etc/nginx/sites-available/{$siteName}", "/etc/nginx/sites-enabled/{$siteName}");
    }
}