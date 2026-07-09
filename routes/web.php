<?php

use App\Http\Controllers\Admin\DashboardController as AdminDashboard;
use App\Http\Controllers\Admin\ReportController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\User\DashboardController as UserDashboard;
use Illuminate\Support\Facades\Route;

// ZONA 1: ROUTE PUBLIK (Bisa diakses tanpa login)
Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('/product/{id}', [HomeController::class, 'show'])->name('product.show');
Route::get('/search', [ProductController::class, 'search'])->name('search');

// ZONA 2: ROUTE ADMIN (Wajib Login & Role Admin)
Route::middleware(['auth', 'admin'])->prefix('admin')->name('admin.')->group(function () {
    // Dashboard
    Route::get('/dashboard', [AdminDashboard::class, 'index'])->name('dashboard');

    // Manajemen Produk
    Route::resource('products', \App\Http\Controllers\Admin\ProductController::class)->names([
        'index' => 'products.index',
        'create' => 'products.create',
        'store' => 'products.store',
        'destroy' => 'products.destroy',
        'edit' => 'products.edit',
        'update' => 'products.update',
    ]);

    // Manajemen Order
    Route::get('/orders', [\App\Http\Controllers\Admin\OrderController::class, 'index'])->name('orders.index');
    Route::get('/orders/export', [\App\Http\Controllers\Admin\OrderController::class, 'export'])->name('orders.export');
    Route::patch('/orders/{id}/status', [\App\Http\Controllers\Admin\OrderController::class, 'updateStatus'])->name('orders.updateStatus');
    Route::delete('/orders/{id}', [\App\Http\Controllers\Admin\OrderController::class, 'destroy'])->name('orders.destroy');

    // Manajemen Laporan
    Route::get('/reports', [ReportController::class, 'index'])->name('reports.index');
    Route::get('/reports/export', [ReportController::class, 'export'])->name('reports.export');
    Route::get('/reports/print', [ReportController::class, 'print'])->name('reports.print');
});

// ZONA 3: ROUTE MEMBER DASAR (Wajib Login, Belum Verif Boleh Masuk)
Route::middleware(['auth'])->group(function () {
    // Dashboard User & Edit Profil (Bebas akses agar user bisa perbaiki email yang salah)
    Route::get('/dashboard', [UserDashboard::class, 'index'])->name('dashboard');
    Route::put('/dashboard/update', [UserDashboard::class, 'update'])->name('dashboard.update');

    // Profile Bawaan Laravel Breeze
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

// ZONA 4: ROUTE TRANSAKSI (Wajib Login & Wajib Verifikasi Email)
Route::middleware(['auth', 'verified'])->group(function () {
    // Keranjang (Cart)
    Route::get('/cart', [CartController::class, 'index'])->name('cart.index');
    Route::post('/cart/add/{id}', [CartController::class, 'store'])->name('cart.add');
    Route::delete('/cart/remove/{id}', [CartController::class, 'destroy'])->name('cart.destroy');
    Route::patch('/cart/update/{id}', [CartController::class, 'update'])->name('cart.update');

    // Checkout & Pembayaran
    Route::get('/checkout', [OrderController::class, 'checkoutPage'])->name('checkout.page');
    Route::post('/checkout/process', [OrderController::class, 'processPayment'])->name('checkout.process');

    // Riwayat, Midtrans & Ulasan
    Route::get('/order/success/{id}', [OrderController::class, 'markAsPaid'])->name('payment.success');
    Route::get('/history', [OrderController::class, 'history'])->name('history');
    Route::post('/order/ship/{id}', [OrderController::class, 'markAsShipped'])->name('order.ship');
    Route::post('/order/receive/{id}', [OrderController::class, 'receiveOrder'])->name('order.receive');
    Route::post('/review', [ReviewController::class, 'store'])->name('review.store');
});

require __DIR__.'/auth.php';
