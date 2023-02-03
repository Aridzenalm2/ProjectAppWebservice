<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMinumanTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('minuman', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string ('nama_minuman', 100);
            $table->string ('harga_minuman', 100);
            $table->text('deskripsi', 255);
            $table->string ('stok_minuman', 100);
            $table->integer('pelanggan_id')->index('pelanggan_id_foregin');
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
        Schema::dropIfExists('minuman');
    }
}
