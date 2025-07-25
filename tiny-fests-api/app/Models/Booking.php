<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Booking extends Model
{
    use HasFactory;

    protected $fillable = [
        'child_name', 'birthday_date', 'location', 'theme',
        'package', 'addons', 'payment_status', 'total_price', 'user_id',
    ];

    protected $casts = [
        'addons' => 'array',
        'birthday_date' => 'date',
    ];

    public function user() {
        return $this->belongsTo(User::class);
    }
}
