<?php

namespace App\Http\Controllers\Api;

use App\Models\Faq;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ContactController extends Controller
{
    public function faqs()
    {
        $faqs = Faq::where('is_active', true)->get();

        return response()->json([
            'success' => true,
            'faqs' => $faqs,
        ]);
    }

    public function contactInfo()
    {
        return response()->json([
            'whatsapp_number' => '+96170123456',
            'phone' => '+96170123456',
            'email' => 'info@tinyfests.com',
        ]);
    }
}
