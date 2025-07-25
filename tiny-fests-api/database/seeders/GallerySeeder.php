<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Gallery;

class GallerySeeder extends Seeder
{
    public function run(): void
    {
        Gallery::create([
            'title' => 'Birthday Bash 2024',
            'type' => 'image',
            'file' => 'gallery/birthday_bash.jpg',
            'category' => 'Birthday',
            'is_featured' => true,
        ]);
    }
}
