<?php

// Panggil *autoload* Composer
require __DIR__.'/../vendor/autoload.php';

// 1. Bangun ulang SELURUH struktur folder 'storage' di dalam RAM Vercel
$tmpStorage = '/tmp/storage';
$directories = [
    'app',
    'framework/cache/data',
    'framework/sessions',
    'framework/testing',
    'framework/views',
    'logs',
];

foreach ($directories as $dir) {
    if (! is_dir($tmpStorage.'/'.$dir)) {
        @mkdir($tmpStorage.'/'.$dir, 0777, true);
    }
}

// 2. Ambil inti aplikasi Laravel
$app = require_once __DIR__.'/../bootstrap/app.php';

// 3. JURUS PAMUNGKAS: Paksa Laravel memakai folder RAM, lupakan folder aslinya!
$app->useStoragePath($tmpStorage);

// 4. Jalankan web sesuai versi Laravel yang kamu gunakan
if (method_exists($app, 'handleRequest')) {
    // Mesin untuk Laravel 11
    $app->handleRequest(Illuminate\Http\Request::capture());
} else {
    // Mesin untuk Laravel 10 ke bawah
    $kernel = $app->make(Illuminate\Contracts\Http\Kernel::class);
    $response = $kernel->handle(
        $request = Illuminate\Http\Request::capture()
    );
    $response->send();
    $kernel->terminate($request, $response);
}
