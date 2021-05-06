<?php

namespace App\Console\Commands;

use App\Services\Shell;
use Illuminate\Support\Str;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;

class AddSiteCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'site:add';

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

        $this->info("You entered {$siteName}");

        $content = File::get(base_path('templates/nginx/config'));

        $content = Str::of($content)
            ->replace("{{ siteName }}", $siteName);

        File::put("/etc/nginx/sites-available/{$siteName}", $content);

        File::link("/etc/nginx/sites-available/{$siteName}", "/etc/nginx/sites-enabled/{$siteName}");

        (new Shell)->execute("mkdir -p /home/jarvis/{$siteName}/public");

        File::copy(base_path('templates/nginx/index.php'), "/home/jarvis/{$siteName}/public/index.php");

        return 0;
    }
}
