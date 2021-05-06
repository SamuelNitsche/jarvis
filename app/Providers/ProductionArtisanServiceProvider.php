<?php

namespace App\Providers;

use Illuminate\Foundation\Providers\ArtisanServiceProvider as ServiceProvider;

class ProductionArtisanServiceProvider extends ServiceProvider
{
    protected $commands = [];
    protected $devCommands = [];

    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {

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
