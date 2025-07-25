<?php
namespace App\Http\Controllers\Api;

use App\Models\Booking;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BookingController extends Controller
{
    public function index()
    {
        return response()->json(Booking::with('user')->latest()->get());
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'child_name' => 'required',
            'birthday_date' => 'required|date',
            'location' => 'required',
            'theme' => 'required',
            'package' => 'required',
            'addons' => 'nullable|array',
            'total_price' => 'required|numeric',
        ]);

        $booking = Booking::create(array_merge($data, [
            'user_id' => auth()->id(),
        ]));

        return response()->json(['success' => true, 'booking' => $booking]);
    }
}
