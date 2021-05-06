<?php

namespace App\Console\Commands;

use App\Services\Site;
use App\Services\Shell;
use Illuminate\Support\Str;
use Illuminate\Console\Command;
use App\Checks\SiteAlreadyExists;
use Illuminate\Support\Facades\File;

class AddSiteCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'site:add {--dry}';

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

        $dryComment = $this->option('dry') ? '[dry-run]' : '';
        $this->info("Obtaining a certificate from Letsencrypt {$dryComment}");
        Site::secure($siteName, dry: $this->option('dry'));

        $this->info("Site [{$siteName}] was created successfully");

        return 0;
    }
}
