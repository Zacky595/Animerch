<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
    // Menampilkan isi keranjang
    public function index()
    {
        $carts = Cart::where('user_id', auth()->id())->with('product')->get();

        return view('cart.index', compact('carts'));
    }

    // Tambah barang ke keranjang
    public function store(Request $request, $id)
    {
        // 1. Ambil jumlah dari input (kalau kosong default 1)
        $quantity = $request->input('quantity', 1);

        $existingCart = Cart::where('user_id', auth()->id())
            ->where('product_id', $id)
            ->first();

        if ($existingCart) {
            // PERBAIKAN: Tambahkan sesuai jumlah yg diinput (bukan cuma +1)
            $existingCart->quantity += $quantity;
            $existingCart->save();
        } else {
            Cart::create([
                'user_id' => auth()->id(),
                'product_id' => $id,
                // PERBAIKAN: Pakai variabel $quantity yg baru
                'quantity' => $quantity,
            ]);
        }

        return redirect()->back()->with('success', 'Barang masuk keranjang!');
    }

    // Hapus barang dari keranjang
    public function destroy($id)
    {
        Cart::destroy($id);

        return redirect()->back();
    }
}
