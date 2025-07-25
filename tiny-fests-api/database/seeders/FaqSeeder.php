<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Faq;

class FaqSeeder extends Seeder
{
    public function run(): void
    {
        Faq::create([
            'question' => 'How do I book a birthday?',
            'answer' => 'Use the Booking Wizard in the app to schedule and pay.',
            'is_active' => true,
        ]);
    }
}
