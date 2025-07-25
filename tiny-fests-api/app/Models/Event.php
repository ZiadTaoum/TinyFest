<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Event extends Model
{
    use HasFactory;

    protected $fillable = [
        'title', 'location', 'start_time', 'description', 'image', 'max_spots',
    ];

    protected $casts = [
        'start_time' => 'datetime',
    ];
}
