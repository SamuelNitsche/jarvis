<?php

namespace App\Providers;

use Illuminate\Database\MigrationServiceProvider as ServiceProvider;

class ProductionMigrationServiceProvider extends ServiceProvider
{
    protected $commands = [];

    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
