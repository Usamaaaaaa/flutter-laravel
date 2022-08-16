<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class CustomerController extends Controller
{
    //
    public function index()
    {    
        $result['customer']=Customer::all();
        //
        return view('customer',$result);
    }
    
    public function manage_customer(Request $request,$id=""){
            if($id>0){
            $arr['data']=Customer::where(['id'=>$id])->get();
              
         $result['name']=$arr['data']['0']->name;
         $result['email']=$arr['data']['0']->email;
        //  print_r($result['category']);
         $result['phone']=$arr['data']['0']->phone;
         $result['address']=$arr['data']['0']->address;
        //  $result['description']=$arr['data']['0']->description;
         $result['id']=$arr['data']['0']->id;
        //  $result['categorylist']=["male","female"];
        $result['customers']=DB::table('customers')->where('id','!=',$id)->get();

        }else{
         $result['name']="";
         $result['email']="";
         $result['phone']="";
         $result['address']="";
        //  $result['description']="";
        //  $result['categorylist']=["male","female"];
         $result['id']="";
         
        $result['customers']=DB::table('customers')->get();
        }
    return view('manage_customer',$result);
    }
    
    public function manage_customerprocess(Request $request){

        $customer=new Customer();
if($request->id>0){
           $customer=Customer::find($request->id);
           $msg="Customer Updated";
        }else{
                      $this->validate(
    $request, 
    ['email' => 'required|unique:customers',
    'phone' => 'required|unique:customers,phone'
      ],
    ['email.unique' => 'email already exist',
    'phone.unique' => 'phone already exist']
);
            $customer=new Customer();
           $msg="Customer Inserted";
        }
        $customer->name=$request->name;
        $customer->email=$request->email; 
        $customer->phone=$request->phone;
        $customer->address=$request->address;
        // $franchise->regdate=$request->rdate;
        $customer->save();
        return redirect('admin/customer')->with('message',$msg);
    }
    public function deleteCustomer($id){
    
        $model=Customer::find($id);
        $model->delete();
        return redirect('admin/customer')->with('message','Customer Deleted');
    }
}
