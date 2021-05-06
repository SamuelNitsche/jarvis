<?php

namespace App\Services;

class Certbot
{
    public static function requestCertificateForDomain($siteName, $dry)
    {
        $dry = $dry ? '--dry-run' : '';

        (new Shell)->execute("certbot certonly --nginx -d {$siteName} {$dry}");
    }
}