<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Minuman extends Model
{
    protected $fillable = array('nama_minuman', 'harga_minuman', 'deskripsi', 'stok_minuman', 'pelanggan_id');

    public $timestamps = true;
}
