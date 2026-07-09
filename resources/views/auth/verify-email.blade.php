<x-guest-layout>
    <div class="mb-6 text-sm text-gray-600 leading-relaxed text-center sm:text-left">
        Terima kasih telah mendaftar! Sebelum mulai berburu koleksi impianmu, mohon verifikasi alamat email kamu dengan
        mengklik tautan yang baru saja kami kirimkan ke inbox-mu.
        <br><br>
        Jika kamu tidak menerima emailnya, jangan khawatir, klik tombol di bawah ini dan kami akan mengirimkannya lagi.
    </div>

    @if (session('status') == 'verification-link-sent')
        <div
            class="mb-6 font-bold text-sm text-green-700 bg-green-50 p-4 rounded-xl border border-green-200 text-center">
            ✅ Tautan verifikasi yang baru telah meluncur ke email kamu! Silakan cek kembali.
        </div>
    @endif

    <div class="mt-4 flex flex-col sm:flex-row items-center justify-between gap-4">

        <form method="POST" action="{{ route('verification.send') }}" class="w-full sm:w-auto">
            @csrf
            <button type="submit"
                class="w-full sm:w-auto bg-blue-600 text-white font-bold py-3 px-6 rounded-xl hover:bg-blue-700 focus:ring-4 focus:ring-blue-300 transition shadow-lg shadow-blue-500/30 transform hover:-translate-y-0.5 text-sm">
                Kirim Ulang Email Verifikasi
            </button>
        </form>

        <form method="POST" action="{{ route('logout') }}" class="w-full sm:w-auto text-center">
            @csrf
            <button type="submit" class="text-sm font-bold text-gray-500 hover:text-red-600 underline transition">
                Log Out
            </button>
        </form>

    </div>
</x-guest-layout>
