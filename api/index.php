<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

try {
    // 1. SAPU BERSIH CACHE LOKAL: Hapus sisa file cache dari Laragon/Windows
    // yang membuat server Linux Vercel kebingungan.
    $cacheFiles = glob(__DIR__.'/../bootstrap/cache/*.php');
    if ($cacheFiles) {
        foreach ($cacheFiles as $file) {
            @unlink($file);
        }
    }

    // 2. Buat folder bayangan di RAM Vercel
    $tmpDir = '/tmp/laravel';
    $directories = [
        "$tmpDir/storage/logs",
        "$tmpDir/storage/framework/views",
        "$tmpDir/storage/framework/cache",
        "$tmpDir/storage/framework/cache/data",
        "$tmpDir/storage/framework/sessions",
    ];

    foreach ($directories as $dir) {
        if (! is_dir($dir)) {
            mkdir($dir, 0777, true);
        }
    }

    // 3. Paksa Laravel memakai folder tersebut
    $_ENV['VIEW_COMPILED_PATH'] = "$tmpDir/storage/framework/views";
    putenv("VIEW_COMPILED_PATH=$tmpDir/storage/framework/views");

    // 4. Jalankan mesin Laravel
    require __DIR__.'/../public/index.php';

} catch (\Throwable $e) {
    // TANGKAP ERROR YANG DISEMBUNYIKAN (Previous Exception)
    $akarMasalah = $e->getPrevious() ? $e->getPrevious() : $e;

    echo "<div style='font-family:sans-serif; padding:20px; background:#ffebeb; border:1px solid #f5c2c7; border-radius:5px;'>";
    echo "<h2 style='color:#842029;'>Detektif Error Tahap 2: Ini Biang Keroknya!</h2>";
    echo '<b>Pesan Error Asli:</b> '.$akarMasalah->getMessage().'<br><br>';
    echo '<b>Lokasi File:</b> '.$akarMasalah->getFile().' (Baris '.$akarMasalah->getLine().')<br><br>';
    echo "<b>Jejak:</b><br><pre style='background:#fff; padding:10px; overflow:auto; font-size:12px; border:1px solid #ccc;'>".$akarMasalah->getTraceAsString().'</pre>';
    echo '</div>';
}
