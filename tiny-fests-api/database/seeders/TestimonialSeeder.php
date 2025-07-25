<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Testimonial;

class TestimonialSeeder extends Seeder
{
    public function run(): void
    {
        Testimonial::create([
            'name' => 'Sarah Mom',
            'message' => 'Absolutely magical party! My daughter loved every second!',
            'rating' => 5,
            'avatar' => null,
        ]);
    }
}

