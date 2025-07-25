<?php

namespace App\Http\Controllers\Api;

use App\Models\Event;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EventController extends Controller
{
    public function index()
    {
        return response()->json(Event::latest()->get());
    }

    public function show($id)
    {
        $event = Event::findOrFail($id);
        return response()->json($event);
    }
}
