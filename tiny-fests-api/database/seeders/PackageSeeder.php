<?php

namespace Database\Seeders;

use App\Models\Package;
use Illuminate\Database\Seeder;

class PackageSeeder extends Seeder
{
    public function run(): void
    {
        Package::insert([
            ['name' => 'Basic', 'description' => 'Includes cake, balloons, and music', 'price' => 100.00],
            ['name' => 'Premium', 'description' => 'Includes everything in Basic + games + decorations', 'price' => 200.00],
            ['name' => 'Custom', 'description' => 'Customize your own experience', 'price' => 0.00],
        ]);
    }
}

