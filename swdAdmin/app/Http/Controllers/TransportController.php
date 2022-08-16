<?php

namespace App\Http\Controllers;

use App\Models\Franchise;
use App\Models\Transport;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;



class TransportController extends Controller
{
    //
    public function index()
    {    
        $result['transports']=Transport::all();
        $result['fran']=Franchise::all();
        
    //     foreach($result['transports'] as $t) {
    //         foreach($result['fran']as $k=>$f){
    //     if($t->franchise_id==$f->id){
            
    //          echo  $result['fran'][$k]->name;
    //     }
    //     }
    //  }
    // }      
    //  
    
    // DB::table('transports'
    //   )->leftJoin('franchises','franchises.id','=','transports.franchise_id')->where(['transports.franchise_id'=>
    //   $t->id])->get();


    // }
    // return $fid;
        return view('transport',$result);
    }
    
    public function manage_transport(Request $request,$id=""){
        if($id>0){
            $arr['data']=Transport::where(['id'=>$id])->get();
            //   return $arr['data'];
         $result['vehicalname']=$arr['data']['0']->vehicalname;
         $result['fid']=$arr['data']['0']->franchise_id;
        //  print_r($result['category']);
         $result['drivername']=$arr['data']['0']->drivername;
         $result['driverPhone']=$arr['data']['0']->driverPhone;
         $result['vehicalnumber']=$arr['data']['0']->vehicalnumber;
         $result['franchise']=DB::table('franchises')->get();
         $result['id']=$arr['data']['0']->id;
        $result['transports']=DB::table('transports')->where('id','!=',$id)->get();

        }else{
         $result['vehicalname']="";
         $result['drivername']="";
         $result['driverPhone']="";
         $result['vehicalnumber']="";
         $result['fid']="";
         
         $result['id']="";
         $result['franchise']=DB::table('franchises')->get();
        $result['transports']=DB::table('transports')->get();
        }
        
    
    return view('manage_transport',$result);
    }
    
    public function manage_transportprocess(Request $request){
        
        // 
        $trans=new Transport();
        if($request->id>0){
           $trans=Transport::find($request->id);
           $msg="Franchise Updated";
        }else{
            $trans=new Transport();
           $msg="Franchise Inserted";
        }
        $trans->vehicalname=$request->name;
        $trans->drivername=$request->dname; 
        $trans->driverPhone=$request->dphone;
        $trans->vehicalnumber=$request->vno;
        if($request->fid==null){
            $request->validate(['fid'=>'required',['fid.required'=>'select franchise']]);
            
        }else{
            
            $trans->franchise_id=$request->fid;
        }
        $trans->save();
        
        return redirect('admin/transport')->with('message',$msg);
    }
    
    public function deleteTransport($id){
    
        $model=Transport::find($id);
        $model->delete();
        return redirect('admin/transport')->with('message','Transport Deleted');
    }
}
