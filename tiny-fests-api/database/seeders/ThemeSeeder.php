<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Theme;

class ThemeSeeder extends Seeder
{
    public function run(): void
    {
        Theme::create([
            'name' => 'Unicorn Dream',
            'category' => 'Fantasy',
            'description' => 'A magical pastel unicorn party.',
            'image' => null,
            'is_active' => true,
        ]);
    }
}
