<?php

namespace App\Http\Controllers;

use App\Models\AssignOrder;
use App\Models\Cart;
use App\Models\PlaceOrder;
use App\Models\UserRegistration;
use Illuminate\Http\Request;

class AssignOrderController extends Controller
{
    //
    public function index(){
        $result['orders']=AssignOrder::where('state','=',null)->orWhere('state','=','pending')
        ->get();
        $result['users']=UserRegistration::all();
        // return $result;
        return view('assignedwork',$result);
    }
    public function DeliverOrder(Request $request){
        $result['req']=$request->except('_token');
        // return $result['req']['torder'];
        $orders=AssignOrder::find($result['req']['oid']);
        $placeorder=PlaceOrder::where(['userid'=>$result['req']['userid'],'status'=>$result['req']['ptype'],'total'=>$result['req']['total'],'visible'=>'off'])->update(['state'=>'deliver']);
        $cart=Cart::where('user',$result['req']['userid'])
        ->where('status',$result['req']['ptype'])
        ->where('state','pending')
        ->where('torder',$result['req']['torder'])
        ->update(['deliver'=>'deliver']);
        // $cart=Cart::where(['user'=>$result['req']['userid'],'status'=>$result['req']['ptype'],'state'=>'pending','orderid'=>$result['req']['oid'],'torder'=>$result['req']['torder']])->get();
        // return $cart;
        // ->update(['deliver'=>'deliver']);
        // 'state'=>'pending',
        // $cart->state='deliver';
        // $cart->save();
      
        
    $orders->update(['state'=>'deliver']);
    
    return redirect('franchise/order')->with('msg','Order Delivered');
    // return $placeorder;
    }
}
