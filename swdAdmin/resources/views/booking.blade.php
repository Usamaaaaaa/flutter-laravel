@extends('layout')
@section('title','Booking')
@section('booking_select','active')
    
@section('container')
    <h1>Booking</h1>
    <a href="{{url('admin/booking/assigned')}}">
    <button type="button" class="btn btn-success">Assigned Booking</button>
    </a>
    @if (Session::has('message'))
    <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
	 {{ Session::get('message') }}
	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
	<span aria-hidden="true">×</span></button>
	</div>
    
    @endif
    <div class="row m-t-30">
        <div class="col-md-12">
                                <!-- DATA TABLE-->
            <div class="table-responsive m-b-40">
                <table class="table table-borderless table-data3">
                        <thead>
                        <tr>
                        <th>ID</th>
                        
                        <th>User</th>
                        <th>total</th>
                        <th>Payment method</th>
                        
                        <th>Action</th>
                        
                        </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($orders as $order)
                                            @foreach ($users as $user)
                                           
                                                @if ($order->userid==$user->id)
                                                
                                                <tr>
                                                <td>{{$order->id}}</td>
                                                
                                                    
                                                <td>{{$user->Firstname.' '.$user->Lastname}}</td>
                                                
                                                <td>{{$order->total}}</td>
                                                <td>{{$order->status}}</td>
                                                {{-- <td>{{$emp->address}}</td>
                                                <td>{{$emp->designation}}</td>
                                                <td>{{$emp->salary}}</td> --}}
                                                <td>
                                                  
                                                    <a href="{{url('admin/booking/manage_booking/')}}/{{$order->id}}" class="btn btn-warning">Assign</a>
                                                    {{-- <a href="{{url('admin/booking/delete/')}}/{{$order->id}}" class="btn btn-danger">Delete</a>  --}}
 
                                                </td>
                                                </tr>
                                                @endif
                                                    
                                                @endforeach
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                <!-- END DATA TABLE-->
                            </div>
                        </div>
@endsection