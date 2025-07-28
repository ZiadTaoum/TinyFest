<?php
namespace App\Http\Controllers\Api;

use App\Models\Booking;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BookingController extends Controller
{
    public function index()
    {
        return response()->json(
            Booking::with(['user', 'theme', 'package', 'addons'])->latest()->get()
        );
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'child_name' => 'required|string|max:255',
            'birthday_date' => 'required|date',
            'location' => 'required|string|max:255',
            'theme_id' => 'required|exists:themes,id',
            'package_id' => 'required|exists:packages,id',
            'addons' => 'nullable|array',
            'addons.*' => 'exists:addons,id',
            'total_price' => 'required|numeric',
        ]);

        $booking = Booking::create([
            'child_name' => $data['child_name'],
            'birthday_date' => $data['birthday_date'],
            'location' => $data['location'],
            'theme_id' => $data['theme_id'],
            'package_id' => $data['package_id'],
            'total_price' => $data['total_price'],
            'user_id' => auth()->id() ?? 1, // fallback for now if not using auth
        ]);

        if (!empty($data['addons'])) {
            $booking->addons()->sync($data['addons']);
        }

        return response()->json([
            'success' => true,
            'booking' => $booking->load(['theme', 'package', 'addons'])
        ]);
    }
}
