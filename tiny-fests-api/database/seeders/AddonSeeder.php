<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Addon;

class AddonSeeder extends Seeder
{
    public function run(): void
    {
        Addon::insert([
            ['name' => 'Foam Party', 'price' => 30.00, 'icon' => '🫧'],
            ['name' => 'Color Fight', 'price' => 20.00, 'icon' => '🎨'],
            ['name' => 'Drone Show', 'price' => 50.00, 'icon' => '🎥'],
        ]);
    }
}
