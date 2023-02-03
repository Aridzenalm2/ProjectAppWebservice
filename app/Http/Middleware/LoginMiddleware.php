<?php
namespace App\Http\Middleware;

use Closure;

class LoginMiddleware{

    public function handle($request, Closure $next){
        
        if (!($request->input('username') == 'tedc' && $request->input('password') == 'rahasia')){

            return "Anda tidak di ijinkan untuk mengakses data nilai, karena username dan password  anda salah.";
        }
        return $next($request);
    }
}