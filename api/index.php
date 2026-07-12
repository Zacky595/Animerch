<?php

// 1. JURUS ANTI-ILUSI: Paksa output menjadi JSON!
// Laravel tidak akan mencari komponen 'view' untuk menampilkan error.
$_SERVER['HTTP_ACCEPT'] = 'application/json';

// 2. Siapkan folder bayangan (RAM Vercel)
$tmpDir = '/tmp/laravel';
@mkdir("$tmpDir/storage/framework/views", 0777, true);
@mkdir("$tmpDir/storage/framework/cache/data", 0777, true);
@mkdir("$tmpDir/storage/framework/sessions", 0777, true);
@mkdir("$tmpDir/storage/logs", 0777, true);

putenv("VIEW_COMPILED_PATH=$tmpDir/storage/framework/views");
$_ENV['VIEW_COMPILED_PATH'] = "$tmpDir/storage/framework/views";

// 3. Panggil mesin utama Laravel
require __DIR__.'/../public/index.php';
