<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Product;

class DashboardController extends Controller
{
    public function index()
    {
        // 1. DATA KARTU STATISTIK
        $totalRevenue = Order::where('status', 'Paid')->sum('total_price');
        $totalOrders = Order::count();
        $totalProducts = Product::count();
        $totalUsers = \App\Models\User::count();

        // 2. DATA PRODUK TERLARIS (Top 5)
        // Kita gabungkan tabel products dengan order_items, lalu hitung jumlah quantity terjual
        $topProducts = Product::select('products.id', 'products.name', 'products.price', 'products.image')
            ->join('order_items', 'products.id', '=', 'order_items.product_id')
            ->join('orders', 'orders.id', '=', 'order_items.order_id')
            ->where('orders.status', 'Paid') // Hanya hitung yang sudah lunas
            ->selectRaw('products.*, SUM(order_items.quantity) as total_sold')
            ->groupBy('products.id')
            ->orderByDesc('total_sold')
            ->take(5) // Ambil 5 teratas
            ->get();

        // 3. DATA GRAFIK (Pendapatan & Pesanan per Bulan) - Opsional biar grafik gerak
        $salesData = Order::selectRaw('MONTH(created_at) as month, SUM(total_price) as total')
            ->where('status', 'Paid')
            ->whereYear('created_at', date('Y'))
            ->groupBy('month')
            ->pluck('total', 'month')->toArray();

        $ordersData = Order::selectRaw('MONTH(created_at) as month, COUNT(*) as total')
            ->whereYear('created_at', date('Y'))
            ->groupBy('month')
            ->pluck('total', 'month')->toArray();

        // Siapkan array kosong untuk 12 bulan
        $chartSales = array_fill(1, 12, 0);
        $chartOrders = array_fill(1, 12, 0);

        // Isi data yang ada
        foreach ($salesData as $month => $total) {
            $chartSales[$month] = $total;
        }
        foreach ($ordersData as $month => $total) {
            $chartOrders[$month] = $total;
        }

        return view('admin.dashboard', compact(
            'totalRevenue', 'totalOrders', 'totalProducts', 'totalUsers',
            'topProducts', 'chartSales', 'chartOrders'
        ));
    }
}
