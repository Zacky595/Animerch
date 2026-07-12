<?php

require __DIR__.'/../vendor/autoload.php';
$app = require_once __DIR__.'/../bootstrap/app.php';

// 1. Pindah Folder Storage ke RAM Vercel agar tidak diblokir
$tmpDir = '/tmp/laravel';
@mkdir("$tmpDir/storage/framework/views", 0777, true);
@mkdir("$tmpDir/storage/framework/cache/data", 0777, true);
@mkdir("$tmpDir/storage/framework/sessions", 0777, true);
@mkdir("$tmpDir/storage/logs", 0777, true);
$app->useStoragePath($tmpDir);

// 2. JURUS ULTIMATE: Ambil Alih Sistem Error Laravel
// Kita ganti mesin pelapor error bawaan Laravel dengan mesin manual kita
// yang tidak butuh komponen 'view' sama sekali.
$app->singleton(
    Illuminate\Contracts\Debug\ExceptionHandler::class,
    function () {
        return new class implements Illuminate\Contracts\Debug\ExceptionHandler
        {
            public function report(\Throwable $e) {}

            public function shouldReport(\Throwable $e)
            {
                return false;
            }

            public function renderForConsole($output, \Throwable $e) {}

            public function render($request, \Throwable $e)
            {
                echo "<div style='font-family:sans-serif; padding:20px; color:#fff; background:#b91c1c; border-radius:8px; margin:20px;'>";
                echo '<h2>🚨 TERTANGKAP! INI ERROR ASLINYA:</h2>';
                echo "<h3 style='color:#fca5a5;'>".$e->getMessage().'</h3>';
                echo '<p><b>Lokasi:</b> '.$e->getFile().' (Baris '.$e->getLine().')</p>';
                echo '</div>';
                exit;
            }
        };
    }
);

// 3. Jalankan Aplikasi
$kernel = $app->make(Illuminate\Contracts\Http\Kernel::class);
$response = $kernel->handle(
    $request = Illuminate\Http\Request::capture()
);
$response->send();
$kernel->terminate($request, $response);
