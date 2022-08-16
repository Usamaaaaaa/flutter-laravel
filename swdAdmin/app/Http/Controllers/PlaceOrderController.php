<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\PlaceOrder;
use Illuminate\Http\Request;

class PlaceOrderController extends Controller
{
    //
    public function insert(Request $request){
        $data=$request->all();
        $model=new PlaceOrder();
        $model->userid=$data['userid'];
        $model->total=$data['total'];
        $model->status=$data['mode'];
        $r=rand(0000,9999);
        $model->torder=$r;
        // $model->save();
        if(isset($model)){
            // $cart=new Cart();

            Cart::where('user',$data['userid'])->where('torder',null)
            ->update(['state'=>'pending','status'=>$data['mode'],'orderid'=>$model->id,'torder'=>$model->torder]);
        //    $cart=Cart::where('user',$data['userid'])->get();
        //    $cart->state='pending';
        //    $cart->save();
            
        }
        $model->save();

        return response()->json([
            // $data
            'success'=>'true',
            // 'data'=>$cart,
        ]);
    }
}
