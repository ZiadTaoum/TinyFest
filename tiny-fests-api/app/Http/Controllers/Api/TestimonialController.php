<?php

namespace App\Http\Controllers\Api;

use App\Models\Testimonial;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TestimonialController extends Controller
{
    public function index()
    {
        return response()->json(Testimonial::latest()->get());
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required',
            'message' => 'required',
            'rating' => 'integer|min:1|max:5',
            'avatar' => 'nullable|image|max:2048',
        ]);

        if ($request->hasFile('avatar')) {
            $data['avatar'] = $request->file('avatar')->store('testimonials', 'public');
        }

        $testimonial = Testimonial::create($data);

        return response()->json(['success' => true, 'testimonial' => $testimonial]);
    }
}
