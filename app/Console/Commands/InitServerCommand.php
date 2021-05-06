<?php

namespace App\Console\Commands;

use App\Services\Shell;
use Illuminate\Console\Command;

class InitServerCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'init';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Initialize server';

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
        $this->info('Add apt repo for nginx mainline');
        (new Shell)->execute('add-apt-repository ppa:nginx/development');

        $this->info('Add apt repo for php');
        (new Shell)->execute('add-apt-repository ppa:ondrej/php');

        $this->info('Add apt repo for php');
        (new Shell)->execute('apt update');

        return 0;
    }
}
