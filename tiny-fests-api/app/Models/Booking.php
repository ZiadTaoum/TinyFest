<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Booking extends Model
{
    use HasFactory;

    protected $fillable = [
        'child_name',
        'birthday_date',
        'location',
        'theme_id',        // Updated from 'theme'
        'package_id',      // Updated from 'package'
        'payment_status',
        'total_price',
        'user_id',
    ];

    protected $casts = [
        'birthday_date' => 'date',
        'total_price' => 'decimal:2',
    ];

    // Define relationships
    public function user() {
        return $this->belongsTo(User::class);
    }

    public function theme() {
        return $this->belongsTo(Theme::class);
    }

    public function package() {
        return $this->belongsTo(Package::class);
    }

    public function addons() {
        return $this->belongsToMany(Addon::class, 'booking_addon');
    }
}