<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Event;

class EventSeeder extends Seeder
{
    public function run(): void
    {
        Event::create([
            'title' => 'Summer Festival',
            'location' => 'Rainbow Field',
            'start_time' => now()->addDays(10),
            'description' => 'Games, color fights, and foam fun!',
            'image' => null,
            'max_spots' => 50,
        ]);
    }
}
