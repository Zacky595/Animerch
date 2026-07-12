<?php

require __DIR__.'/../vendor/autoload.php';

// 1. Siapkan semua folder bayangan di RAM (termasuk bootstrap/cache)
$tmpDir = '/tmp/laravel';
@mkdir("$tmpDir/storage/framework/views", 0777, true);
@mkdir("$tmpDir/storage/framework/cache/data", 0777, true);
@mkdir("$tmpDir/storage/framework/sessions", 0777, true);
@mkdir("$tmpDir/storage/logs", 0777, true);
@mkdir("$tmpDir/bootstrap/cache", 0777, true);

// 2. Arahkan semua file cache sistem ke RAM agar tidak diblokir Vercel
$_ENV['APP_SERVICES_CACHE'] = "$tmpDir/bootstrap/cache/services.php";
$_ENV['APP_PACKAGES_CACHE'] = "$tmpDir/bootstrap/cache/packages.php";
$_ENV['APP_CONFIG_CACHE'] = "$tmpDir/bootstrap/cache/config.php";
$_ENV['APP_ROUTES_CACHE'] = "$tmpDir/bootstrap/cache/routes.php";
$_ENV['APP_EVENTS_CACHE'] = "$tmpDir/bootstrap/cache/events.php";
putenv("VIEW_COMPILED_PATH=$tmpDir/storage/framework/views");
$_ENV['VIEW_COMPILED_PATH'] = "$tmpDir/storage/framework/views";

$app = require_once __DIR__.'/../bootstrap/app.php';

// 3. Pindahkan folder Storage utama
$app->useStoragePath("$tmpDir/storage");

// 4. Jalankan Aplikasi secara normal
$kernel = $app->make(Illuminate\Contracts\Http\Kernel::class);
$response = $kernel->handle(
    $request = Illuminate\Http\Request::capture()
);
$response->send();
$kernel->terminate($request, $response);
