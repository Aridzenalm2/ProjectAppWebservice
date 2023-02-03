<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePelangganTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pelanggan', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string ('nama_pelanggan', 100);
            $table->string ('minuman_favorit', 100);
            $table->string ('point_pelanggan', 100);
            $table->string ('bonus_pembelian', 100);
            $table->string ('tanggal_pembelian', 100);
            $table->string ('Total_pembelian', 100);
            $table->text ('komentar_minuman', 255);
            $table->string('gambar', 100);
            $table->string ('total_bonus', 100);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pelanggan');
    }
}
