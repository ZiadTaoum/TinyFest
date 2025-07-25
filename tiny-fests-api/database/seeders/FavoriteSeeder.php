<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Favorite;
use App\Models\User;

class FavoriteSeeder extends Seeder
{
    public function run(): void
    {
        Favorite::create([
            'user_id' => User::first()->id,
            'type' => 'theme',
            'value' => 'Unicorn Dream',
        ]);
    }
}
