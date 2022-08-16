@extends('layout')
@section('title','Orders')
@section('order_select','active')
    
@section('container')
    <h1>Order Detail</h1>
    {{-- <a href="{{url('admin/booking/assigned')}}">
    <button type="button" class="btn btn-success">Assigned Booking</button>
    </a> --}}
    {{-- @if (Session::has('message'))
    <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
	 {{ Session::get('message') }}
	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
	<span aria-hidden="true">×</span></button>
	</div>
    
    @endif --}}
    <div class="row m-t-30">
        <div class="col-md-12">
                                <!-- DATA TABLE-->
            <div class="table-responsive m-b-40">
                <table class="table table-borderless table-data3">
                        <thead>
                        <tr>
                        <th>User Name</th>
                        <th>Dlvry. Address</th>
                        <th>Phone</th>
                        
                        <th>Service</th>
                        <th>Quantity</th>
                        <th>Category</th>
                        
                        {{-- <th>Action</th> --}}
                        
                        </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($carts as $cart)
                                                {{-- @foreach ($Assign as $assign) --}}
                                                    
                                                 @if($paytype==$cart->status)
                                                <tr>
                                                <td>{{$req['user']}}</td>  
                                                <td>{{$req['address']}}</td>   
                                                <td>{{$req['phone']}}</td>    
                                                <td>{{$cart->name}}</td>
                                                <td>{{$cart->quantity}}</td>
                                                <td>{{$cart->category}}</td>
                                                
                                                </tr>
                                    
                                                @endif
                                                
                                                @endforeach
                                                
                                        </tbody>
                                    </table>
                                </div>
                                <!-- END DATA TABLE-->
                            </div>
                        </div>
@endsection