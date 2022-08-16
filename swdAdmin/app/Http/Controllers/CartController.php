<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
    //
    public function index(Request $request){
        $cart=new Cart();
    //    $d= $request->all();
    //     return response()->json(
            
    //         $d
    //     );
       $cart->name=$request->post('name');
       $cart->price=$request->post('price');
       
       $cart->image=$request->post('image');
       $cart->quantity=$request->post('quantity');
       $cart->category=$request->post('category');
       $cart->user=$request->post('user');
       $cart->sid=$request->post('id');
    $cart->save();
    return response()->json([
            'success' => 'true',
            'message' => "", 
        ]);
    }
    public function show(Request $request){
        // $id= $request->get('id');
        $id= $request[1];
        // $cart= Cart::all();
        
        $cart= Cart::where('user','=',$id)->where('state','=',null)
        ->get();
        // return $cart;
        return response()->json(
            // 'success' => 'true',
            // 'id'=>$cart
        
            // $id
            $cart
        );
    }
    
    
    public function Disp(Request $request){
        return $request->post('id');
        $cart= Cart::all();
        // return $cart;
        return response()->json(
            
            // $id
        );
        // $cart= Cart::where('user',$id);
        // return $cart;
        return response()->json(
            
            // $id
        );
    }
    public function delete(Request $request){
        $id=$request[0];
        // return $id;
        $cart= Cart::find($id);
        $cart->delete();
        // return $cart;
        return response()->json([
            'succss'=>'true']
        );
    }
    
    public function update(Request $request){
       $id= $request->post('id');
    //    return response()->json(
            
    //         $id
    //     );
        $cart= Cart::find($id);
    //    $d= $request->name;
       $cart->name=$request->post('name');
       $cart->price=$request->post('price');
       $cart->quantity=$request->post('quantity');
       $cart->category=$request->post('category');
       $cart->user=$request->post('user');
       $cart->sid=$request->id;
    $cart->save();
    return response()->json([
            'success' => 'true',
            'message' => 'update', 
        ]);
    }
    public function userOrder(){
        $cart=Cart::where('user',6)->
        where('deliver',null)->
        where('state',null)->orWhere('state','pending')->get();
        return $cart;
    }
}
