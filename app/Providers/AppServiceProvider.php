<?php

namespace App\Providers;

use Illuminate\Support\Facades\URL;
use Illuminate\Support\ServiceProvider; // <-- Tambahkan baris ini

class AppServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        //
    }

    public function boot(): void
    {
        // Paksa HTTPS jika berjalan di Vercel (Production)
        if (env('APP_ENV') !== 'local') {
            URL::forceScheme('https');
        }
    }
}
