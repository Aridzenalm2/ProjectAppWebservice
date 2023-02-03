<?php

namespace App\Http\Controllers;

use App\Models\Minuman;
use Illuminate\Http\Request;

class MinumanController extends Controller
{
    public function index(Request $request)
    {
        $acceptHeader = $request->header('Accept');

        if ($acceptHeader === 'application/json' || $acceptHeader === 'application/xml'){
            $minuman = Minuman::OrderBy("id", "DESC")->paginate(10);

            if ($acceptHeader === 'application/json'){
                return response()->json($minuman->items('data'),200);
            } else {
                $xml = new \SimpleXMLElement('<minuman/>');
                foreach ($minuman->items('data') as $item) {
                    $xmlItem = $xml->addChild('minuman');

                    $xmlItem->addChild('id', $item->id);
                    $xmlItem->addChild('nama_minuman', $item->nama_minuman);
                    $xmlItem->addChild('harga_minuman', $item->harga_minuman);
                    $xmlItem->addChild('deskripsi', $item->deskripsi);
                    $xmlItem->addChild('stok_minuman', $item->stok_minuman);
                    $xmlItem->addChild('minuman_id', $item->minuman_id);
                    $xmlItem->addChild('created_at', $item->created_at);
                    $xmlItem->addChild('update_at', $item->update_at);
                }
                return $xml->asXML();
            }
        } else {
            $minuman = Minuman::OrderBy("id", "DESC")->paginate(10);

            if ($acceptHeader === 'application/json'){
                return response()->json($minuman->items('data'),200);
            } else {
                $xml = new \SimpleXMLElement('<minuman/>');
                foreach ($minuman->items('data') as $item) {
                    $xmlItem = $xml->addChild('minuman');

                    $xmlItem->addChild('id', $item->id);
                    $xmlItem->addChild('nama_minuman', $item->nama_minuman);
                    $xmlItem->addChild('harga_minuman', $item->harga_minuman);
                    $xmlItem->addChild('deskripsi', $item->deskripsi);
                    $xmlItem->addChild('stok_minuman', $item->stok_minuman);
                    $xmlItem->addChild('minuman_id', $item->minuman_id);
                    $xmlItem->addChild('created_at', $item->created_at);
                    $xmlItem->addChild('update_at', $item->update_at);
                }
                return $xml->asXML();
            }
        }
    }

    public function store(Request $request)
    {
        $input = $request->all();
        $validationRules = [
            'nama_minuman' => 'required',
            'harga_minuman' => 'required',
            'deskripsi' => 'required',
            'stok_minuman' => 'required',
            'pelanggan_id' => 'required|exists:pelanggan,id'
        ];

        $validator = \Validator::make($input, $validationRules);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
        $minuman = Minuman::create($input);
        return response()->json($minuman, 200);
    }

    public function show(Request $request, $id)
    {
        $acceptHeader = $request->header('Accept');

        if ($acceptHeader === 'application/json' || $acceptHeader === 'application/xml') {
            $contentTypeHeader = $request->header('Content-Type');

            if ($contentTypeHeader === 'application/json') {
                $minuman = Minuman::find($id);

                if (!$minuman) {
                    abort(404);
                }

                return response()->json($minuman, 200);
            } else {
                return response('Tipe Media Tidak Mendukung!', 415);
            }
        } else {
            return response('Tidak Bisa Diterima!', 406);
        }
    }

    public function update(Request $request, $id)
    {
        $input = $request->all();

        $minuman = Minuman::find($id);

        if (!$minuman) {
            abort(404);
        }

        $validationRules = [
            'nama_minuman' => 'required',
            'harga_minuman' => 'required',
            'deskripsi' => 'required',
            'stok_minuman' => 'required',
            'pelanggan_id' => 'required|exists:pelanggan,id'
        ];

        $validator = \Validator::make($input, $validationRules);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $minuman->fill($input);
        $minuman->save();

        return response()->json($minuman, 200);
    }

    public function destroy(Request $request, $id)
    {
        $acceptHeader = $request->header('Accept');

        if ($acceptHeader === 'application/json' || $acceptHeader === 'application/xml') {
            $contentTypeHeader = $request->header('Content-Type');

            if ($contentTypeHeader === 'application/json') {
                $minuman = Minuman::find($id);

                if (!$minuman) {
                    abort(404);
                }

                $minuman->delete();
                $message = ['message' => 'delete akun berhasil', 'minuman_id' => $id];

                return response()->json($message, 200);
            } else {
                return response('Tipe Media Tidak Mendukung!', 415);
            }
        } else {
            return response('Tidak Bisa Diterima!', 406);
        }
    }
}
