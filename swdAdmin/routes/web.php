<?php

use App\Http\Controllers\AssignOrderController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\Collection;
use App\Http\Controllers\Dashboard;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\FranchiseController;
use App\Http\Controllers\TransportController;
use App\Http\Controllers\ProfileController;

use App\Http\Controllers\ServieController;
use App\Http\Controllers\UserRegistrationController;
use App\Models\AssignOrder;

// use App\Models\AssignOrder;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('layout');
// });
Route::get('/', function () {
    return view('login');
});
Route::get('booking', function () {
    return view('booking');
});
Route::get('admin/registration',[UserRegistrationController::class,'AdminRegistration']);
Route::post('admin/auth',[UserRegistrationController::class,'Auth'])->name('admin.auth');
Route::get('admin',function(){
    
     if(session()->has('islogin'))
     {
           return view('dashboard'); 
     }
    else{
        return view('login');
    }
        return view('login');

});

Route::group(['middleware'=>'adminAuth'],function(){
       
Route::get('admin/dashboard',[Dashboard::class,'index'])->name('admin.dashboard');

// Route::get('admin/dashboard', function () {
// return view('dashboard'); 
// })->name('admin.dashboard');
            //////////////////////////////////////////
                         #category route or servies
            //////////////////////////////////////////            
Route::get('admin/category',[ServieController::class,'index']);
Route::get('admin/category/manage_category',[ServieController::class,'manage_category']);
Route::post('admin/category/manage_category_process',
[ServieController::class,'manage_categoryprocess'])->name('category.manage_categoryprocess');

Route::get('admin/category/delete/{id}',[ServieController::class,'deleteCategory']);

Route::get('admin/category/manage_category/{id}',
[ServieController::class,'manage_category']);
            //////////////////////////////////////////
                         #customer route
            //////////////////////////////////////////            
Route::get('admin/customer',[CustomerController::class,'index']);
Route::get('admin/customer/manage_customer',[CustomerController::class,'manage_customer']);
Route::post('admin/customer/manage_customer_process',
[CustomerController::class,'manage_customerprocess'])->name('customer.manage_customerprocess');

Route::get('admin/customer/delete/{id}',[CustomerController::class,'deleteCustomer']);

Route::get('admin/customer/manage_customer/{id}',
[CustomerController::class,'manage_customer']);
            //////////////////////////////////////////
                         #franchise route
            //////////////////////////////////////////            
Route::get('admin/franchise',[FranchiseController::class,'index']);
// Route::get('admin/franchise',[FranchiseController::class,'index']);
Route::get('admin/franchise/manage_franchise',[FranchiseController::class,'manage_franchise']);
Route::post('admin/franchise/manage_franchise_process',
[FranchiseController::class,'manage_franchiseprocess'])->name('franchise.manage_franchiseprocess');

Route::get('admin/franchise/delete/{id}',[FranchiseController::class,'deleteFranchise']);

Route::get('admin/franchise/manage_franchise/{id}',
[FranchiseController::class,'manage_franchise']);
            //////////////////////////////////////////
                         #transport route
            //////////////////////////////////////////            
Route::get('admin/transport',[TransportController::class,'index']);
Route::get('admin/transport/manage_transport',[TransportController::class,'manage_transport']);
Route::post('admin/transport/manage_transport_process',
[TransportController::class,'manage_transportprocess'])->name('transport.manage_transportprocess');

Route::get('admin/transport/delete/{id}',[TransportController::class,'deleteTransport']);

Route::get('admin/transport/manage_transport/{id}',
[TransportController::class,'manage_transport']);
            //////////////////////////////////////////
                         #profile route
            //////////////////////////////////////////            
Route::get('admin/profile',[ProfileController::class,'index']);
Route::get('admin/profile/manage_profile',[ProfileController::class,'manage_profile']);
Route::post('admin/profile/manage_profile_process',
[ProfileController::class,'manage_profileprocess'])->name('profile.manage_profileprocess');

Route::get('admin/profile/delete/{id}',[ProfileController::class,'deleteProfile']);

Route::get('admin/profile/manage_profile/{id}',
[ProfileController::class,'manage_profile']);

Route::get('profile/status/{type}/{id}',[ProfileController::class,'status']);


            //////////////////////////////////////////
                         #employee route
            //////////////////////////////////////////            
Route::get('admin/employee',[EmployeeController::class,'index']);
Route::get('admin/employee/manage_employee',[EmployeeController::class,'manage_employee']);
Route::post('admin/employee/manage_employee_process',
[EmployeeController::class,'manage_employeeprocess'])->name('employee.manage_employeeprocess');

Route::get('admin/employee/delete/{id}',[EmployeeController::class,'deleteEmployee']);

Route::get('admin/employee/manage_employee/{id}',
[EmployeeController::class,'manage_employee']);


            //////////////////////////////////////////
                         #Booking route
            //////////////////////////////////////////            
Route::get('admin/booking',[BookingController::class,'index']);
Route::get('admin/booking/manage_booking',[BookingController::class,'manage_booking']);
Route::post('admin/booking/manage_booking_process',
[BookingController::class,'manage_bookingprocess'])->name('booking.manage_bookingprocess');

Route::get('admin/booking/delete/{id}',[BookingController::class,'deleteBooking']);

Route::get('admin/booking/manage_booking/{id}',
[BookingController::class,'manage_booking']);

            //////////////////////////////////////////
                         #Assigned Work route
            //////////////////////////////////////////            
Route::get('admin/booking/assigned',[AssignOrderController::class,'index']);

            //////////////////////////////////////////
                         #Assigned Work route
            //////////////////////////////////////////  
 
Route::get('franchise/order',[FranchiseController::class,'getFranchiseOrder']);   

Route::get('franchise/order/online',[FranchiseController::class,'onlineFranchiseOrder']);        
// Route::get('franchise/assigned/manage_order/{id}',[FranchiseController::class,'getOrderDetail'])->name('assignedorder');

Route::post('franchise/assigned/manage_order',[FranchiseController::class,'getOrderDetail'])->name('assignedorder');         
Route::post('franchise/assignedorder/deliver',[AssignOrderController::class,'DeliverOrder'])->name('deliveredorder');

            //////////////////////////////////////////
                         #collection route
            ////////////////////////////////////////// 

Route::get('admin/collections',[Collection::class,'collectionDetail']);

Route::get('admin/collection/clear/{id}',[Collection::class,'clearDetail']);
});

            //////////////////////////////////////////
                         #report route
            ////////////////////////////////////////// 

Route::get('admin/report',[Collection::class,'generateReport']);

Route::post('admin/monthly/report',[Collection::class,'monthlyReport'])->name('monthlyreport');

Route::get('admin/logout', function () {
    session()->forget('islogin');
      session()->forget('isadmin');
      session()->forget('isfranchise');
        return redirect('/');
});