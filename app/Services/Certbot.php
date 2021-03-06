<?php

namespace App\Services;

class Certbot
{
    public static function requestCertificateForDomain($siteName, $dry)
    {
        $emailAddress = 'support@samys.network';

        if ($dry) {
            (new Shell)->execute("certbot certonly --nginx -d {$siteName} --dry-run");
        } else {
            (new Shell)->execute("certbot certonly --nginx -d {$siteName} -m {$emailAddress} --agree-tos");
        }
    }
}