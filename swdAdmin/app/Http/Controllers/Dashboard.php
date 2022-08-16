<?php

namespace App\Http\Controllers;

use App\Models\AssignOrder;
use App\Models\Franchise;
use App\Models\PlaceOrder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Dashboard extends Controller
{
    //
    public function index(){
        
        $admin=session()->get('isadmin');
        
        $franchise=session()->get('isfranchise');
        
        $franchisetotal=Franchise::all();
        $result['totalfranchise']=count($franchisetotal);
        if(!empty($admin)){
            $orders=PlaceOrder::where('visible','=',null)->get();
            $result['ordercount']=count($orders);
            
            $assignorders=PlaceOrder::where('visible','=','off')->get();
        $result['assignordercount']=count($assignorders);
        
        
         $balance = DB::table('franchises')->sum('total');
         $result['total']=$balance;
         $online = DB::table('assign_orders')->where('paymenttype','=','online')->sum('total');
         $result['ototal']=$online;
         // $result['total']=count($total);
         
         return view('dashboard',$result);
        }
        else {
            $orders=AssignOrder::where('franchise',$franchise)->get();  
            $result['ordercount']=count($orders);
            //  $balance = DB::table('assign_orders')->where(['paymenttype'=>'cod','franchise'=>$franchise])->sum('total');
            
            $balance = DB::table('franchises')->where(['name'=>$franchise])->sum('total');
            $result['total']=$balance;
            return view('dashboard',$result);
            // return $franchise;
        }
    }
}
