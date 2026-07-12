<?php

// Buat kerangka folder bayangan di RAM Vercel
$tmpDir = '/tmp/laravel';
@mkdir("$tmpDir/storage/framework/views", 0777, true);
@mkdir("$tmpDir/storage/framework/cache/data", 0777, true);
@mkdir("$tmpDir/storage/framework/sessions", 0777, true);
@mkdir("$tmpDir/storage/logs", 0777, true);

// Arahkan sistem kompilasi Laravel ke RAM
putenv("VIEW_COMPILED_PATH=$tmpDir/storage/framework/views");
$_ENV['VIEW_COMPILED_PATH'] = "$tmpDir/storage/framework/views";

// Jalankan aplikasi utama
require __DIR__.'/../public/index.php';
