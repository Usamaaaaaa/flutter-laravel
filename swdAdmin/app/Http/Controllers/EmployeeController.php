<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EmployeeController extends Controller
{
    //
    public function index()
    {    
        $admin=session()->get('isadmin');
        $franchise=session()->get('isfranchise');
        // return $admin;
            if(empty($admin)){
                
            $result['employees']=Employee::where(['addby'=>$franchise])->get();
        }else{
            
            $result['employees']=Employee::where(['addby'=>'admin'])->get();
        }
        //
        
        
    // $result['employees']=Employee::where(['addby'=>$franchise])->get();
        // return $result['employees'];
        return view('employee',$result);
    }
    
    public function manage_employee(Request $request,$id=""){
        
          if($id>0){
            
            $arr['data']=Employee::where(['id'=>$id])->get();
         
              
         $result['name']=$arr['data']['0']->name;
        //  print_r($result['category']);
         $result['phone']=$arr['data']['0']->phone;
         
         $result['email']=$arr['data']['0']->email;
         $result['address']=$arr['data']['0']->address;
         $result['desg']=$arr['data']['0']->designation;
         $result['sal']=$arr['data']['0']->salary;
         $result['id']=$arr['data']['0']->id;
        $result['employees']=DB::table('employees')->where('id','!=',$id)->get();

        }else{
         $result['name']="";
         $result['phone']="";
         $result['address']="";
         
         $result['email']="";
         $result['desg']="";
         $result['sal']="";
         $result['id']="";
         
        $result['employees']=DB::table('employees')->get();
        }
    
    return view('manage_employee',$result);
    }
    
    public function manage_employeeprocess(Request $request){
        if($request->id>0){
         $request->validate([
            'phone'=>'required|min:11|max:11',
            'email'=>'required',
            'address'=>'required',
            'sal'=>'required|max:6',
            

            ['phone.unique'=>'Phone already exist',
            'email.unique'=>'Email already exist',
            ]
        ]);
        }else{
        $request->validate([
            'phone'=>'required|unique:employees|min:11|max:11',
            'email'=>'required|unique:employees,email',
            'address'=>'required|',
            'sal'=>'required|max:6',
            

            ['phone.unique'=>'Phone already exist',
            'email.unique'=>'Email already exist',
            ]
        ]);
    }
        $admin=session()->get('isadmin');
        $franchise=session()->get('isfranchise');

           $emp=new Employee();
if($request->id>0){
           $emp=Employee::find($request->id);
           $msg="Employee Updated";
        }else{
//                       $this->validate(
//     $request, 
//     ['email' => 'required|unique:customers',
//     'phone' => 'required|unique:customers,phone'
//       ],
//     ['email.unique' => 'email already exist',
//     'phone.unique' => 'phone already exist']
// );
            $emp=new Employee();
           $msg="Employee Inserted";
        }
        $emp->name=$request->name;
        $emp->phone=$request->phone;
        $emp->address=$request->address;
        $emp->designation=$request->desg;
        $emp->salary=$request->sal; 
        $emp->email=$request->email;
        if(empty($admin)){
        $emp->addby=$franchise;
        }else{
            
        $emp->addby='admin';
        }  
        $emp->save();
     
        return redirect('admin/employee')->with('message',$msg);
    }
    
    public function deleteEmployee($id){
    
        $model=Employee::find($id);
        $model->delete();
        return redirect('admin/employee')->with('message','Employee Deleted');
    }
}
