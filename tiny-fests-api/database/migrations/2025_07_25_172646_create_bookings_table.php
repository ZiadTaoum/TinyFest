<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->id();

            $table->string('child_name');
            $table->date('birthday_date');

            $table->string('location');

            $table->string('theme'); // e.g. "Space Party", "Unicorn World"
            $table->string('package'); // e.g. "Basic", "Premium", "Custom"

            $table->json('addons')->nullable(); // e.g. ["Drone Show", "Foam Party"]

            $table->enum('payment_status', ['pending', 'paid'])->default('pending');

            $table->decimal('total_price', 10, 2)->default(0.00);

            $table->foreignId('user_id')->constrained()->onDelete('cascade');

            $table->timestamps();
        });
    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bookings');
    }
};
