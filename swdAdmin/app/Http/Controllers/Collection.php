<?php

namespace App\Http\Controllers;

use App\Models\AssignOrder;
use App\Models\Franchise;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Collection extends Controller
{
    //
    public function collectionDetail(){
        $result['franchise']=Franchise::all();
        $result['assignorder']=DB::table('assign_orders')->where('paymenttype','=','cod')->get();
        // return $result['franchise'][0]['name'];
        return view('collection',$result);

    }
    public function clearDetail($id){
        $franchise=Franchise::find($id);
        $franchise->ovrallsum+=$franchise->total;
        $franchise->total=0;
        $franchise->save();
        return redirect('admin/collections');
    }
    public function generateReport(){
        
        $result['req']="";
        $result['franchises']=Franchise::all();
        // AssignOrder::where()
        return view('report',$result);
    }
    
    public function monthlyReport(Request $request){
        $result['req']=$request->except('_token');
        // return $request->sdate;
        
        $result['franchises']=Franchise::all();
        // return $result['count'];
        // AssignOrder::where()
        // return $request->all();
        return view('report',$result);
    }
}
