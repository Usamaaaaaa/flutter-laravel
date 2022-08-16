<?php

namespace App\Http\Controllers;

use App\Models\AssignOrder;
use App\Models\Booking;
use App\Models\Franchise;
use App\Models\PlaceOrder;
use App\Models\UserRegistration;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BookingController extends Controller
{ public function index()
    {    
        $result['orders']=PlaceOrder::where('visible','=',null)->get();
        $result['users']=UserRegistration::all();
        //
        return view('booking',$result);
    }
    public function manage_booking(Request $request,$id=""){
        // echo $id;
                if($id>0){
            $arr['data']=PlaceOrder::where(['id'=>$id])->get();
            // $data=
            $dt=UserRegistration::select('Firstname','Lastname','id')->where('id',$arr['data']['0']->userid)->get();
            // echo $arr['data'];
            $name=$dt[0]['Firstname'].' '.$dt[0]['Lastname'];
              
         $result['name']=$name;
         $result['total']=$arr['data']['0']->total;
         $result['userid']=$dt[0]['id'];
         $result['paytype']=$arr['data']['0']->status;
         $result['torder']=$arr['data']['0']->torder;
         $result['id']=$arr['data']['0']->id;
         $result['franchises']=Franchise::all();

        }else{
         $result['name']="";
         $result['total']="";

         $result['paytype']="";
         $result['id']="";
         
        }
       return view('assignbooking',$result);
    }
    public function manage_bookingprocess(Request $request){
        // return $request->tid;
        // $request->validate([
        //     'name'=>'required',
        //     // 'category'=>'required',
        //     'price'=>'required',
        //     'image'=>'mimes:jpeg,jpg,png',
        //     'desc'=>'required',
        // ]);
        $request->validate([
            'franchise'=>'required',
            
            ['franchise.required'=>'Please select frachise',
            ]

        ]);
        // return"oh";
        $assign=new AssignOrder();
        $assign->user=$request->uid;
        $assign->franchise=$request->franchise;
        $assign->total=$request->total;
        $assign->paymenttype=$request->paytype;
        $assign->cart=$request->tid;
         $assign->save();
        // return $assign;
        if($assign->isNot(null)){
            $model=PlaceOrder::find($request->id);
            $model->visible='off';
            $model->save();
            // chnge 
            // $cart=Cart:: 
            
         $balance = DB::table('assign_orders')->where(['paymenttype'=>'cod','franchise'=>$request->franchise])->sum('total');

        }
        $franchise=Franchise::where('name',$request->franchise)->update(['total'=>$balance]);
            return redirect('admin/booking')->with('message',"Work Assign");
        // }
    }
    public function deleteBooking($id){
        // return $id;
        $model=PlaceOrder::find($id);
        $model->delete();
        
        return redirect('admin/booking')->with('message',"Delete Successfully");
    }
    
    
}
