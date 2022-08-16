<?php

use App\Http\Controllers\CartController;
use App\Http\Controllers\PlaceOrderController;
use App\Http\Controllers\ServieController;
use App\Http\Controllers\UserRegistrationController;
use App\Http\Controllers\ProfileController;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
// Route::get("/userdata/{id}",[UserRegistrationController::class,'GetUser']);

Route::post('/register', [UserRegistrationController::class,'register']);
Route::post('/login', [UserRegistrationController::class,'login']);
Route::get('/home',[ServieController::class,'home']);
Route::post('/cart',[CartController::class,'index']);

Route::post('/memberstatus',[ProfileController::class,'mStatus']);

// Route::get('getcart/{id}',[CartController::class,'Disp']);

Route::post('getcart',[CartController::class,'show']);

Route::post('getuser',[UserRegistrationController::class,'show']);

Route::post('getprofile',[ProfileController::class,'Profile']);

Route::post('postprofile',[ProfileController::class,'MakeProfile']);

Route::post('postorder',[PlaceOrderController::class,'insert']);

Route::post('deletecart',[CartController::class,'delete']);

Route::post('updatecart',[CartController::class,'update']);

Route::post('userorder',[CartController::class,'userOrder']);

Route::get('userorder',function(){
    return "yes";
});