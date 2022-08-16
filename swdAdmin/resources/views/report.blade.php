@php
use App\Models\AssignOrder;
use App\Models\Franchise;

use Illuminate\Support\Carbon;
    
@endphp
@extends('layout')
@section('title','Report')
@section('report_select','active')
    
@section('container')
    <h1>Franchises & Order Detail</h1>
     <form action="{{route('monthlyreport')}}" method="post">
        @csrf
        <div class="form-row">
            <div class="form-group col-md-2">
                <input type="date" name="sdate" id="stdate" class="form-control">
            </div>
            <div class="form-group col-md-2">
                <input type="date" name="ldate" id="ltdate" class="form-control">
            </div>
            <div class="form-group ">
                <input type="submit" name="sm-btn" value="submit" class="form-control btn btn-danger">
            </div>
            
        </div>
    </form>
    <div class="row m-t-30">
        <div class="col-md-12">
                                <!-- DATA TABLE-->
            <div class="table-responsive m-b-40">
                <table class="table table-borderless table-data3">
                        <thead>
                        <tr>
                        <th>Franchise</th>
                        <th>Order Assigned</th>
                        <th>Franchise(%)</th>
                        <th>Company(%)</th>
                        <th>Ovrall Collection</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach ($franchises as $franchise)
                        @php
                        if (empty($req)) {
                        $assignorder=AssignOrder::where(['franchise'=>$franchise->name,'state'=>null])->count();
                                            
                        $deliverorder=AssignOrder::where(['franchise'=>$franchise->name,'state'=>'deliver'])->count();
                                            
                        $percentage=Franchise::select('total')->where(['name'=>$franchise->name])->get();
                        $total=$percentage[0]->total;
                        } else {
                            
        $deliverorder=AssignOrder::where('state','deliver')->
        where('franchise',$franchise->name)->
        whereBetween('created_at',[$req['sdate'],
        Carbon::parse($req['ldate'])->endOfDay()])->count();
                            
        $assignorder=AssignOrder::where('franchise',$franchise->name)->
        whereBetween('created_at',[$req['sdate'],
        Carbon::parse($req['ldate'])->endOfDay()])->count();

       $percentage =AssignOrder::where('state','deliver')->
       where('franchise',$franchise->name)->whereBetween('created_at',[$req['sdate'],
        Carbon::parse($req['ldate'])->endOfDay()])
        ->sum('total');
        // echo $percentage;
          $total=$percentage;
                        }
                        @endphp
                        <tr>
                        <td>{{$franchise->name}}</td>
                        <td>{{$assignorder}}</td>
                        
                        @if ($total==null)
                        <td>{{0}}</td>
                        @else
                        <td>{{(40/100)*$total}}</td>
                        @endif
                        @if ($total==null)
                        <td>{{0}}</td>
                                            @else
                                            <td>{{(60/100)*$total}}</td>
                                            @endif
                                            @if ($franchise->total==null)
                                                
                                            <td>{{0}}</td>
                                            @else
                                                
                                            <td>{{$total}}</td>
                                            @endif
                                        </tr>
                                        @endforeach
                                    </tbody>
                                    </table>
                                </div>
                                <!-- END DATA TABLE-->
                            </div>
                        </div>
@endsection