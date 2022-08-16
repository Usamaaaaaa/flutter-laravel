<?php

namespace App\Http\Controllers;

use App\Models\AssignOrder;
use App\Models\Cart;
use App\Models\Franchise;
use App\Models\PlaceOrder;
use App\Models\Servie;
use App\Models\UserRegistration;
use Illuminate\Contracts\Session\Session;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session as FacadesSession;

class FranchiseController extends Controller

{

    //
    public function index()
    {    
        $result['franchises']=Franchise::all();
        //
        return view('franchise',$result);
    }
    
    public function manage_franchise(Request $request,$id=""){
             if($id>0){
            $arr['data']=Franchise::where(['id'=>$id])->get();
              
         $result['name']=$arr['data']['0']->name;
         $result['code']=$arr['data']['0']->code;
        //  print_r($result['category']);
         $result['email']=$arr['data']['0']->email;
         $result['phone']=$arr['data']['0']->phone;
         $result['address']=$arr['data']['0']->address;
         $result['rdate']=Carbon::parse($arr['data']['0']->rdate)->format('Y-m-d')
         ;
         $result['id']=$arr['data']['0']->id;
        //  $result['categorylist']=["male","female"];
        $result['franchises']=DB::table('franchises')->where('id','!=',$id)->get();

        }else{
         $result['name']="";
         $result['email']="";
         $result['phone']="";
         $result['address']="";
         $result['rdate']="";
         $result['code']="";
        //  $result['description']="";
        //  $result['categorylist']=["male","female"];
         $result['id']="";
         
        $result['franchises']=DB::table('franchises')->get();
        }
        
        // $result['franc']=DB::table('franchised')->get();
    
    return view('manage_franchise',$result);
    }
    
    public function manage_franchiseprocess(Request $request){
        if($request->id>0){

        $request->validate([
            'name'=>'required',
            'phone'=>'required|min:11|max:11',
            'email'=>'required',
            'address'=>'required|',
            'code'=>'required|min:4|max:4',]);
        }else{
        $request->validate([
            'name'=>'required|unique:franchises',
            'phone'=>'required|unique:franchises|min:11|max:11',
            'email'=>'required|unique:franchises,email',
            'address'=>'required|',
            'code'=>'required|unique:franchises,code|min:4|max:4',
            

            ['phone.unique'=>'Phone already exist',
            'email.unique'=>'Email already exist',
            'code.unique'=>'Franchise Code already exist',
            'name.unique'=>'Franchise Name already exist'
            ]
        ]);}
        $franchise=new Franchise();
        if($request->id>0){
           $franchise=Franchise::find($request->id);
           $msg="Franchise Updated";
        }else{
            $franchise=new Franchise();
           $msg="Franchise Inserted";
        }
        $franchise->name=$request->name;
        $franchise->email=$request->email; 
        $franchise->phone=$request->phone;
        $franchise->address=$request->address;
        $franchise->regdate=$request->rdate;
        $franchise->code=$request->code;
        $franchise->save();
        
        
        return redirect('admin/franchise')->with('message',$msg);
    }
    
    public function deleteFranchise($id){
    
        $model=Franchise::find($id);
        $model->delete();
        return redirect('admin/franchise')->with('message','Franchise Deleted');
    }

    public function getFranchiseOrder(){
        $franchise=session()->get('isfranchise');
        // return $franchise;
        $result['orders']=AssignOrder::where('franchise',$franchise)->where('paymenttype','cod')->where('state',null)
        ->get();
        $result['users']=UserRegistration::all();
        $result['cart']=Cart::all();
        $result['services']=Servie::all();
        $result['cactive']='active';
        $result['oactive']='';
        // return $result['cart'];
        
        return view('assignedwork',$result);

    }
    
    public function onlineFranchiseOrder(){
        $franchise=session()->get('isfranchise');
        // return $franchise;
        $result['orders']=AssignOrder::where('franchise',$franchise)->where('paymenttype','online')
        ->get();
        $result['users']=UserRegistration::all();
        $result['cart']=Cart::all();
        $result['services']=Servie::all();
        $result['oactive']='active';
        $result['cactive']='';
        // return $result['cart'];
        
        return view('assignedwork',$result);

    }
    
    public function getOrderDetail(Request $request){
        $result['req']= $request->except('_token');
        // return $result['req'];

        $franchise=session()->get('isfranchise');
        // return $franchise;
        $result['Assign']=AssignOrder::where(['user'=>$result['req']['userid'],'state'=>'null','franchise'=>$franchise,'paymenttype'=>$result['req']['ptype']])->get();

        // $result['orders']=PlaceOrder::where(['userid'=>$result['req']['userid'],
        //     'visible'=>'off','status'=>$result['req']['ptype'],'state'=>null])->get();
    //    $type=$result['orders'][0]['status'];
        $result['carts']=Cart::select('name','quantity','category','user','price','status')->
        where('user','=',$result['req']['userid'])->where('state','=','pending')->where('deliver','=',null)->where('torder',$result['req']['torder'])
        ->get();
        // return $result['carts'];
        
        return view('franchise/showdetail',$result,['paytype'=>$result['req']['ptype']]);

    }
}
