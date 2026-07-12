<?php

// 1. Buat folder bayangan di direktori /tmp (satu-satunya folder yang tidak dikunci Vercel)
$tmpDir = '/tmp/laravel';
$directories = [
    "$tmpDir/storage/logs",
    "$tmpDir/storage/framework/views",
    "$tmpDir/storage/framework/cache",
    "$tmpDir/storage/framework/cache/data",
    "$tmpDir/storage/framework/sessions",
    "$tmpDir/bootstrap/cache",
];

foreach ($directories as $dir) {
    if (! is_dir($dir)) {
        mkdir($dir, 0777, true);
    }
}

// 2. Paksa Laravel menggunakan folder bayangan tersebut secara otomatis
putenv("VIEW_COMPILED_PATH=$tmpDir/storage/framework/views");
$_ENV['VIEW_COMPILED_PATH'] = "$tmpDir/storage/framework/views";

// 3. Jalankan aplikasi Laravel
require __DIR__.'/../public/index.php';
