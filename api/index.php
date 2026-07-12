<?php

// Paksa PHP untuk menampilkan error dasar
ini_set('display_errors', 1);
error_reporting(E_ALL);

try {
    // Buat folder bayangan di RAM Vercel
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

    // Paksa Laravel memakai folder tersebut
    $_ENV['VIEW_COMPILED_PATH'] = "$tmpDir/storage/framework/views";
    putenv("VIEW_COMPILED_PATH=$tmpDir/storage/framework/views");

    // Jalankan mesin Laravel
    require __DIR__.'/../public/index.php';

} catch (\Throwable $e) {
    // TANGKAP ERROR ASLI DAN TAMPILKAN KE LAYAR!
    echo "<div style='font-family:sans-serif; padding:20px; background:#ffebeb; border:1px solid #f5c2c7; border-radius:5px;'>";
    echo "<h2 style='color:#842029;'>Detektif Error: Ini masalah aslinya!</h2>";
    echo '<b>Pesan Error:</b> '.$e->getMessage().'<br><br>';
    echo '<b>Lokasi File:</b> '.$e->getFile().' (Baris '.$e->getLine().')<br><br>';
    echo "<b>Jejak (Stack Trace):</b><br><pre style='background:#fff; padding:10px; overflow:auto; font-size:12px; border:1px solid #ccc;'>".$e->getTraceAsString().'</pre>';
    echo '</div>';
}
