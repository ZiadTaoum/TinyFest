<?php
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\BookingController;
use App\Http\Controllers\Api\EventController;
use App\Http\Controllers\Api\MyAccountController;

use App\Http\Controllers\Api\ContactController;

use App\Http\Controllers\Api\ThemeController;

use App\Http\Controllers\Api\GalleryController;
use App\Http\Controllers\Api\TestimonialController;

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/bookings', [BookingController::class, 'index']);
    Route::post('/bookings', [BookingController::class, 'store']);
});

Route::get('/events', [EventController::class, 'index']);
Route::get('/events/{id}', [EventController::class, 'show']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/my-account', [MyAccountController::class, 'profile']);
    Route::post('/favorites', [MyAccountController::class, 'addFavorite']);
    Route::delete('/favorites/{id}', [MyAccountController::class, 'removeFavorite']);
});

Route::get('/contact-info', [ContactController::class, 'contactInfo']);
Route::get('/faqs', [ContactController::class, 'faqs']);


Route::get('/themes', [ThemeController::class, 'index']);
    Route::post('/themes', [ThemeController::class, 'store']); // Admin usage
    Route::get('/themes/{id}', [ThemeController::class, 'show']);
    Route::delete('/themes/{id}', [ThemeController::class, 'destroy']);


Route::get('/portfolio', [GalleryController::class, 'index']);
Route::post('/portfolio', [GalleryController::class, 'store']); // Admin usage
Route::delete('/portfolio/{id}', [GalleryController::class, 'destroy']);

Route::get('/testimonials', [TestimonialController::class, 'index']);
Route::post('/testimonials', [TestimonialController::class, 'store']);