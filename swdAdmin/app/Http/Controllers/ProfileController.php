<?php

namespace App\Http\Controllers;

use App\Models\Profile;
use App\Models\UserRegistration;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use function PHPUnit\Framework\isEmpty;
use function PHPUnit\Framework\isNull;

class ProfileController extends Controller
{
    //
    public function index()
    {    
        $result['profiles']=Profile::all();
        $result['users']=UserRegistration::all();
        
        //
        return view('profile',$result);
    }



        public function status(Request $req,$type,$id)
    {
        //
        // echo $id;
        $model=Profile::find($id);
        $model->status=$type;
        $model->save();
        return redirect('admin/profile')->with('msg','Status Updated');

    }
    
    public function manage_profile(Request $request,$id=""){
    
    return view('manage_profile');
    }
    
    public function manage_profileprocess(Request $request){
        
        return redirect('admin/profile')->with('message','');
    }
    public function Profile(Request $request){
        $input=$request[1];

        $user=UserRegistration::find($input);

        $pro=Profile::select('membership','image')->
        where('user_registration_id',$input)->get();
        // $data = array_merge($user->toArray(), $pro->toArray());
        
        // return response()->json($pro);
        if($pro->isEmpty()){
        return response()->json($user);
    }else{
        // http://127.0.0.1:8000
        $user['membership']=$pro[0]->membership;
        // for mobile 
        // $user['image']='http://192.168.73.142:8000/storage/media/profile/'.$pro[0]->image;
        // for emulator 
        $user['image']='http://10.0.2.2:8000/storage/media/profile/'.$pro[0]->image;
        return response()->json($user);
    }
        // return response()->json($pro[0]->membership);
    }
    public function MakeProfile(Request $req){
       $data=$req->all();
    //    $data1=$req->post('image');
    $user=UserRegistration::find($req->id);
    $user->Firstname=$req->Firstname;
    $user->Lastname=$req->Lastname;
    $user->email=$req->email;
    $user->Phone=$req->Phone;
    $user->Address=$req->Address;
    $user->save();
    $profile=Profile::where('user_registration_id','=',$req->id)->get();
        
    if($profile->isEmpty()){
        
        $model= new Profile();
        if($req->hasFile('image')){
             $image=$req->file('image');
            $ext=$image->extension();
            $image_name= time().$image->getClientOriginalName();
            $image->storeAs('/public/media/profile',$image_name);
            
            
        }
        $model->image=$image_name;
        $model->user_registration_id=$req->id;
        // $model->date=Carbon::now();
        $model->save();
        return response()->json(['status'=>'C',
            'message'=>'Profile Created ']);
        
    }else{
        if($req->hasFile('image')){
            $image=$req->file('image');
            $ext=$image->extension();
            $image_name= time().$image->getClientOriginalName();
            $image->storeAs('/public/media/profile',$image_name);
            
            Profile::where('user_registration_id',$data['id'])->update(['image'=>$image_name]);
            
        }
        return response()->json(['status'=>'U',
            'message'=>'Profile Update ']);
    }
 
    }
    public function mStatus(Request $request){
        return $request->all();
    }
}
