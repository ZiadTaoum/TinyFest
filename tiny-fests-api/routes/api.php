<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\BookingController;
use App\Http\Controllers\Api\EventController;
use App\Http\Controllers\Api\MyAccountController;
use App\Http\Controllers\Api\ContactController;
use App\Http\Controllers\Api\ThemeController;
use App\Http\Controllers\Api\GalleryController;
use App\Http\Controllers\Api\TestimonialController;
use App\Http\Controllers\Api\PackageController;
use App\Http\Controllers\Api\AddonController;

// 📦 Public Routes
Route::get('/events', [EventController::class, 'index']);
Route::get('/events/{id}', [EventController::class, 'show']);

Route::get('/themes', [ThemeController::class, 'index']);
Route::get('/themes/{id}', [ThemeController::class, 'show']);

Route::get('/packages', [PackageController::class, 'index']);
Route::get('/addons', [AddonController::class, 'index']);

Route::get('/portfolio', [GalleryController::class, 'index']);
Route::get('/testimonials', [TestimonialController::class, 'index']);

Route::get('/contact-info', [ContactController::class, 'contactInfo']);
Route::get('/faqs', [ContactController::class, 'faqs']);

// 🛡️ Authenticated Routes
// Route::middleware('auth:sanctum')->group(function () {
    Route::get('/bookings', [BookingController::class, 'index']);
    Route::post('/bookings', [BookingController::class, 'store']);

    Route::get('/my-account', [MyAccountController::class, 'profile']);
    Route::post('/favorites', [MyAccountController::class, 'addFavorite']);
    Route::delete('/favorites/{id}', [MyAccountController::class, 'removeFavorite']);
// });

// 🔒 Admin Usage (can be protected later by middleware or roles)
Route::post('/themes', [ThemeController::class, 'store']);
Route::delete('/themes/{id}', [ThemeController::class, 'destroy']);

Route::post('/portfolio', [GalleryController::class, 'store']);
Route::delete('/portfolio/{id}', [GalleryController::class, 'destroy']);

Route::post('/testimonials', [TestimonialController::class, 'store']);
