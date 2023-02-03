<?php

/** @var \Laravel\Lumen\Routing\Router $router */

use App\Http\Controllers\postsController;

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->get('/hello-lumen/{name}', function ($name) {
    return "<h1>Lumen</h1><p>Hi <b>" . $name . "</b>, thanks for using Lumen</p>";
});

$router->get('/ucapan-selamat-datang', ['middleware' => 'login', function () {
    return "<h2>SELAMAT DATANG DI KOTA BANDUNG<br>==================================
    </h2><p><b>Semoga perjalanan anda selamat sampai tujuan</b></p>";
}]);

$router->get('pemberitahuan', 'UsersController@index');

$router->get('/transaksi/{name}', function ($name) {
    return "<h1>Transaksi Sukses</h1><p> Uang sebesar : <b>" . $name . "</b>, Telah berhasil di Transfer</p>";
});

// $router->get('posts', 'PostsController@index');


$router->post('/minuman', 'MinumanController@store');
$router->put('/minuman/{id}', 'MinumanController@update');
$router->delete('/minuman/{id}', 'MinumanController@destroy');

$router->post('/pelanggan', 'PelangganController@store');
$router->put('/pelanggan/{id}', 'PelangganController@update');
$router->delete('/pelanggan/{id}', 'PelangganController@destroy');


$router->get('/minuman', 'MinumanController@index');
$router->get('/minuman/{id}', 'MinumanController@show');

$router->get('/pelanggan', 'PelangganController@index');
$router->get('/pelanggan/{id}', 'PelangganController@show');

$router->get('/posts', 'PostsController@index');
$router->post('/posts', 'PostsController@store');
$router->get('/posts/{id}', 'PostsController@show');
$router->put('/posts/{id}', 'PostsController@update');
$router->delete('/posts/{id}', 'PostsController@destroy');


//authentication
$router->group(['prefix' => 'auth'], function () use ($router) {
    //Mathces "api/register
    $router->post('/register', 'AuthController@register');
});
