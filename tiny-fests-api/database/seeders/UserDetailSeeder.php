<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\UserDetail;
use App\Models\User;

class UserDetailSeeder extends Seeder
{
    public function run(): void
    {
        UserDetail::create([
            'user_id' => User::first()->id,
            'loyalty_points' => 120,
            'notification_enabled' => true,
        ]);
    }
}
