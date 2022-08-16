<?php

namespace App\Http\Controllers;

use App\Models\Servie;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use mysqli;

class ServieController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {    
        $result['categorys']=Servie::all();
        //
        return view('category',$result);
    }
    public function manage_category(Request $request,$id=""){
                if($id>0){
            $arr['data']=Servie::where(['id'=>$id])->get();
              
         $result['name']=$arr['data']['0']->name;
         $result['category']=$arr['data']['0']->category;
        //  print_r($result['category']);
         $result['price']=$arr['data']['0']->price;
         $result['image']=$arr['data']['0']->image;
         $result['description']=$arr['data']['0']->description;
         $result['id']=$arr['data']['0']->id;
         $result['categorylist']=["male","female"];
        $result['categorys']=DB::table('servies')->where('id','!=',$id)->get();

        }else{
         $result['name']="";
         $result['category']="";
         $result['price']="";
         $result['image']="";
         $result['description']="";
         $result['categorylist']=["male","female"];
         $result['id']="";
         
        $result['categorys']=DB::table('servies')->get();
        }
 return view('manage_category',$result);
    }
    public function manage_categoryprocess(Request $request){
        // $request->validate([
        //     'name'=>'required',
        //     // 'category'=>'required',
        //     'price'=>'required',
        //     'image'=>'mimes:jpeg,jpg,png',
        //     'desc'=>'required',
        // ]);
        $service=new Servie();
        if($request->id>0){
           $service=Servie::find($request->id);
           $msg="Category Updated";
        }else{
            $service=new Servie();
           $msg="Category Inserted";
        }
        $service->name=$request->name;
        if($request->category==null){
            $request->validate(['category'=>'required']);
            
        }else{
            $service->category=$request->category;
            
        }
            $service->price=$request->price; 
            $service->description=$request->description;
            if($request->hasFile('image')){
                    $image=$request->file('image');
                    $ext=$image->extension();
                 $image_name= time().$image->getClientOriginalName();
                    
                    $image->storeAs('/public/media/service',$image_name);
                    $service->image=$image_name;
                }
                $service->save();
        
        // if(isset($service)){
            return redirect('admin/category')->with('message',$msg);
        // }
    }
    public function deleteCategory($id){
    
        $model=Servie::find($id);
        // $model=DB::table('servies')->where('id',$id)->get();
        
        //  $image_path = '/storage/media/service/'.$model[0]->image;
         $p=public_path().'/storage/media/service/'.$model->image;
        
        
    if( File::exists($p) ){
        File::delete($p);
        // return "File doesn't exists";
    }
        $model->delete();
        return redirect('admin/category')->with('message','Category Deleted');
    }
   
    public function home(){
        $data=Servie::all();
        
        // $data['data']->image;
        $url=url('http://127.0.0.1:8000/storage/media/service/');
        // return $url;
        foreach($data as $k=> $d){ 
            // for emulator
            $data[$k]->image='http://10.0.2.2:8000/storage/media/service/'.$d->image;
            // for mobile 
            
            // $data[$k]->image='http://192.168.73.142:8000/storage/media/service/'.$d->image;
        }
        // return $data;
        if(isset($data)){
            return response()->json([
            'success' => 'true',
            'data' => $data, 
        ]);
        }else{
            
        return response()->json([
            'success' => 'false',
        ]);
        }
    }
   
}
