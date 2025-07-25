<?php

namespace App\Http\Controllers\Api;

use App\Models\Gallery;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class GalleryController extends Controller
{
    public function index()
    {
        return response()->json(Gallery::latest()->get());
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'title' => 'required|string',
            'type' => 'required|in:image,video',
            'file' => 'required',
            'category' => 'nullable|string',
            'is_featured' => 'boolean'
        ]);

        if ($request->type === 'image' && $request->hasFile('file')) {
            $data['file'] = $request->file('file')->store('gallery', 'public');
        }

        $gallery = Gallery::create($data);

        return response()->json(['success' => true, 'gallery' => $gallery]);
    }

    public function destroy($id)
    {
        $item = Gallery::findOrFail($id);
        $item->delete();
        return response()->json(['success' => true]);
    }
}

