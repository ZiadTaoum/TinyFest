<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Theme;

class ThemeSeeder extends Seeder
{
    public function run(): void
    {
        Theme::insert([
            ['name' => 'Unicorn World', 'image' => 'themes/unicorn.jpg'],
            ['name' => 'Space Adventure', 'image' => 'themes/space.jpg'],
            ['name' => 'Jungle Safari', 'image' => 'themes/jungle.jpg'],
        ]);
    }
}
