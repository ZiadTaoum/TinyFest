<?php

namespace App\Http\Controllers\Api;

use App\Models\Favorite;
use App\Models\UserDetail;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class MyAccountController extends Controller
{
    public function profile(Request $request)
    {
        $user = $request->user()->load('details', 'favorites');

        return response()->json([
            'user' => $user,
        ]);
    }

    public function addFavorite(Request $request)
    {
        $data = $request->validate([
            'type' => 'required|string',
            'value' => 'required|string',
        ]);

        $favorite = Favorite::firstOrCreate([
            'user_id' => auth()->id(),
            'type' => $data['type'],
            'value' => $data['value'],
        ]);

        return response()->json(['success' => true, 'favorite' => $favorite]);
    }

    public function removeFavorite($id)
    {
        $fav = Favorite::where('id', $id)->where('user_id', auth()->id())->first();
        if ($fav) {
            $fav->delete();
            return response()->json(['success' => true]);
        }

        return response()->json(['error' => 'Not found'], 404);
    }
}
