<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\Franchise;
use App\Models\User;
use App\Models\UserRegistration;
use GuzzleHttp\Psr7\Response;
use Hamcrest\Core\IsNot;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

use function PHPUnit\Framework\isEmpty;

class UserRegistrationController extends Controller
{
    // insert($request->all());
    // $cart=new Cart;
    // // $cart->id=3;
    // $cart->name=$request->name;
    // $cart->price=$request->post('price');
    // $cart->quantity=$request->post('quantity');
    // $cart->category=$request->post('category');
    // $cart->user=$request->post('user');
    // $cart->save();
      public function register(Request $request){
        
        // return $request->post('Address');
        // return $request->all();
        // create the user account 
        // $created=UserRegistration::create($request->all());
        $checkemail=UserRegistration::where('email',$request->post('email'))->get();
        
        $checkphone=UserRegistration::where('Phone',$request->post('Phone'))->get();
        if(count($checkemail)>0){
             return response()->json([
            'success' => 'false',
            'message' => 'Email Already Exist '.$request->post('email'), 
        ]);
        }
         if(count($checkphone)>0  ){
             return response()->json([
            'success' => 'false',
            'message' => 'Phone  Already Exist '.$request->post('Phone'), 
        ]);
        }
        

     if(isset($request) && isEmpty($checkemail) && isEmpty($checkphone)){
        $user=new UserRegistration();
        $user->Firstname=$request->post('Firstname');
        $user->Lastname=$request->post('Lastname');
        $user->email=$request->post('email');
        $user->Phone=$request->post('Phone');
        $user->Password=$request->post('Password');
        $user->Cpassword=$request->post('Cpassword');
        $user->Address=$request->post('Address');
        $user->role="user";
        $user->save();
        // login now..
        return response()->json([
            'success' => 'true',
            'message' => $request->Firstname.' Register Sucessfully! you can login', 
        ]);
    }else{
            return response()->json([
            'success' => 'false',
            'message' => 'Registeration Fail', 
        ]);
    }
}
    public function login(Request $request)
    {  
        $user = UserRegistration::where('email',$request->email)->first();
        // return $user;
        if(!isset($user)){
            $franchise=Franchise::where('email','=',$request->email)->first();
          if(!isset($franchise)){
            $driver=Employee::where('email','=',$request->email)->where('addby','=','admin')->first();
            if(!isset($driver)){
         

             return response()->json([
                'success' => 'false',
                'message' => 'Invalid Email',
            ], 401);
        }else{
            if($request->Password==$driver->phone){
                
              return response()->json([
              'success' => 'true',
               'user' => $driver,
              'role'=>'driver'
         ]);

            }
            else{
            
            return response()->json([
                'success' => 'false',
                'message' => 'Invalid  Password',
            ], 401);
        }
        }
          }else{
            if($request->Password==$franchise->code){

              return response()->json([
              'success' => 'true',
              // 'token' => $jwt_token,
               'user' => $franchise,
              'role'=>'franchise'
         ]);
        //  return view('/');
        }else{
            return response()->json([
                'success' => 'false',
                'message' => 'Invalid  Password',
            ], 401);
        }
         }
        }
       if($request->email==$user->email){

           if($request->Password==$user->Password){

            return response()->json([
             'success' => 'true',
             'user' => $user,
             'role'=>'user'
              ]);

           }else{
           
           if(Hash::check($request->Password,$user->Password)){
            return response()->json([
            'success' => 'true',
            'user' => $user,
            'role'=>'admin'
        ]);
           }
        
        else{
            return response()->json([
                'success' => 'false',
                'message' => 'Invalid  Password',
            ], 401);
           }
       }}    
    else{
        $admin=UserRegistration::where('email',$request->email)->get();
        if(!empty($admin)){
            
           if(Hash::check($request->Password,$user->Password)){
            return response()->json([
            'success' => 'true',
            'user' => $admin,
            'role'=>'admin'
        ]);
           }
           else{
            
            return response()->json([
                'success' => 'false',
                'message' => 'Invalid  Password',
            ], 401);
        }
        
        }
    else{
         return response()->json([
                'success' => 'false',
                'message' => 'Email not exist',
            ], 401);
    }
    // return redirect('/');
}

    }
public function AdminRegistration(){
    //  if(isset($request)){
        $user=new UserRegistration();
        $user->Firstname="Muhammad";
        $user->Lastname="Usama";
        $user->email="SwdAdmin@gmail.com";
        $user->Phone="03177890096";
        $user->Password=Hash::make("swd@admin");
        $user->Cpassword=Hash::make($user->Password);
        $user->Address="Admin Address";
        $user->role="admin";
        $user->save();
        // login now..
    //     return response()->json([
    //         'success' => 'true',
    //         'message' => $request->Firstname.' Register Sucessfully!you can login', 
    //     ]);
    // }else{
    //         return response()->json([
    //         'success' => 'false',
    //         'message' => 'Registeration Fail', 
    //     ]);
    // }


}
public function Auth(Request $request){
    //  return redirect()->route('admin.dashboard');
       $user = UserRegistration::where('email',$request->email)->first();
       
    //    else{
        // return $user;
        if(!isset($user)){
             $franchise=Franchise::where('email','=',$request->email)->first();
            //  return $franchise;

             if(empty($franchise)){
                 
                 return redirect('/')->with('message','Invalid user');
                }
                else{
                    if($request->Password==$franchise->code){
                
               $request->session()->put('islogin', 'true');
               $request->session()->put('isfranchise', $franchise->name);
            return redirect()->route('admin.dashboard');
            }
            else{
                
                 return redirect('/')->with('message','Invalid Password');
            }
            }
            // return redirect('/')->with('message','Invalid user');
        }
        if(empty($user)){
        
            return redirect('/')->with('message','Invalid user');
       }
    // }

            // return redirect('/')->with('message','Invalid user');
    // }
        // else if($user->is(null)){
            
        // }
        
          if($request->email==$user->email){
           if(Hash::check($request->Password,$user->Password)){
               $request->session()->put('islogin', 'true');
               $request->session()->put('isadmin', 'yes');
               return redirect()->route('admin.dashboard');
               

           }else{
            return redirect('/')->with('message','Invalid password');
           }
        
    }
    else{
            return redirect()->with('message','Invalid email');
    }

}


public function show(Request $request){
    $id= $request[1];
    $user=UserRegistration::find($id);
    $result['name']=$user->Firstname.' '.$user->Lastname;
    $result['phone']=$user->Phone;
    $result['address']=$user->Address;
    
         return response()->json([
                'success' => 'true',
                'user'=>$result
            ]);
}
 

    }
// }
