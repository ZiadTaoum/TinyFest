<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Booking;
use App\Models\User;

class BookingSeeder extends Seeder
{
    public function run(): void
    {
        $user = User::first();

        Booking::create([
            'child_name' => 'Emma',
            'birthday_date' => '2025-08-10',
            'location' => 'Magic Park',
            'theme' => 'Unicorn Dream',
            'package' => 'Premium',
            'addons' => json_encode(['foam', 'color fight']),
            'payment_status' => 'paid',
            'total_price' => 250,
            'user_id' => $user->id,
        ]);
    }
}

