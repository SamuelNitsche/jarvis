<?php

namespace App\Console\Commands;

use App\Services\Site;
use Illuminate\Console\Command;

class AddSiteCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'site:add {--insecure} {--dry}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Add a new site to the server';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $siteName = $this->ask('Please enter the domain name');

        if (Site::exists($siteName)) {
            $this->error("Site [{$siteName}] already exists!");
            return 1;
        }

        $this->info("Create the site [{$siteName}]");
        Site::create($siteName);

        if (!$this->option('insecure')) {
            $this->info('Checking if ssl certificate is already available');
            if (!Site::sslCertificateExists($siteName)) {
                $dryComment = $this->option('dry') ? '[dry-run]' : '';
                $this->info("Obtaining a certificate from Letsencrypt {$dryComment}");
                Site::secure($siteName, dry: $this->option('dry'));
            } else {
                Site::enableSslConfig($siteName);
            }
        }

        $this->info("Site [{$siteName}] was created successfully");

        return 0;
    }
}
