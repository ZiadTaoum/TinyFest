<?php

namespace App\Http\Controllers\Api;

use App\Models\Theme;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class ThemeController extends Controller
{
    public function index()
    {
        return response()->json(Theme::where('is_active', true)->get());
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string',
            'category' => 'nullable|string',
            'description' => 'nullable|string',
            'image' => 'nullable|image|max:2048',
        ]);

        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('themes', 'public');
        }

        $theme = Theme::create($data);

        return response()->json(['success' => true, 'theme' => $theme]);
    }

    public function show($id)
    {
        return response()->json(Theme::findOrFail($id));
    }

    public function destroy($id)
    {
        $theme = Theme::findOrFail($id);
        $theme->delete();

        return response()->json(['success' => true]);
    }
}
