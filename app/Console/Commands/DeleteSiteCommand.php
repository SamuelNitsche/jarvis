<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;

class DeleteSiteCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'site:delete';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Delete a site from the server';

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

        if (! File::exists("/etc/nginx/sites-enabled/{$siteName}")) {
            $this->error("Site [{$siteName}] does not exist!");
            return 1;
        }

        File::deleteDirectory("/home/jarvis/{$siteName}");
        File::delete([
            "/etc/nginx/sites-enabled/{$siteName}",
            "/etc/nginx/sites-available/{$siteName}",
        ]);

        return 0;
    }
}
