<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        if ($this->app->environment() === 'production') {
            $this->app->register(ProductionArtisanServiceProvider::class);
            $this->app->register(ProductionSailServiceProvider::class);
            $this->app->register(ProductionMigrationServiceProvider::class);
            // @TODO: Find a way to deregister the "test" command
//            $this->app->register(ProductionCollisionServiceProvider::class);
            $this->app->register(ProductionTinkerServiceProvider::class);
        }
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
