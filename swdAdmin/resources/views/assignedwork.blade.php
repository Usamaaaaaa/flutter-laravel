@extends('layout')
@section('title','Assign Booking')
@if (Session::get('isfranchise'))    
@section('order_select','active')
@else    
@section('booking_select','active')
@endif
    
@section('container')
    <h1>Assigned Booking</h1>
    @if (Session::has('isfranchise'))
        
    <nav class="navbar navbar-expand-lg navbar-light ">
  {{-- <a class="navbar-brand" href="#">Navbar</a> --}}
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item {{$cactive}}">
        <a class="nav-link" href="{{url('franchise/order')}}">Cash Delivery <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item {{$oactive}}">
        <a class="nav-link" href="{{url('franchise/order/online')}}">Online</a>
      </li>
    </ul>
  </div>
</nav>

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
                        <th>Status</th>
                        <th>Franchise</th>
                        
                        <th>Action                       </th>
                        
                        </tr>
                                        </thead>
                                        <tbody>
                                                    
                                            @foreach ($orders as $order)
                                            @foreach ($users as $user)
                                            
                                                @if ($order->user==$user->id)
                                                <tr>
                                                <td>{{$order->id}}</td>
                                                
                                                <td>{{$user->Firstname.' '.$user->Lastname}}</td>
                                                
                                                <td>{{$order->total}}</td>

                                                <td>{{$order->paymenttype}}</td>
                                                
                                                <td>{{$order->franchise}}</td>
                                                <td>
                                                    <form action="{{route('assignedorder')}}" method="post">
                                                        @csrf
                                                     <Button type="submit" class="btn btn-warning">  Detail
                                                    </Button> 
                                                    <input type="hidden" name="oid" value="{{$order->id}}">
                                                    <input type="hidden" name="user" value="{{$user->Firstname.' '.$user->Lastname}}">
                                                    
                                                    <input type="hidden" name="address" value="{{$user->Address}}">
                                                    <input type="hidden" name="phone" value="{{$user->Phone}}">
                                                    <input type="hidden" name="userid" value="{{$user->id}}">
                                                    <input type="hidden" name="ptype" value="{{$order->paymenttype}}">
                                                    
                                                    <input type="hidden" name="torder" value="{{$order->cart}}">
                                                    
                                                    </form>
                                     
    @if (Session::has('isfranchise'))               
                                                    <form action="{{route('deliveredorder')}}" method="post">
                                                        @csrf
                                                     <Button type="submit" class="btn btn-danger">  Deliver
                                                    </Button> 
                                                    <input type="hidden" name="oid" value="{{$order->id}}">
                                                    <input type="hidden" name="user" value="{{$user->Firstname.' '.$user->Lastname}}">
                                                    
                                                    <input type="hidden" name="total" value="{{$order->total}}">
                                                    <input type="hidden" name="phone" value="{{$user->Phone}}">
                                                    <input type="hidden" name="userid" value="{{$user->id}}">
                                                    <input type="hidden" name="ptype" value="{{$order->paymenttype}}">
                                                    
                                                    <input type="hidden" name="torder" value="{{$order->cart}}">
                                                    
                                                    </form>
                                                    @endif
{{--                                                     
                                                    <a href="{{url('franchise/assigned/deliver')}}/{{$order->id}}" class="btn btn-danger">Deliver</a> --}}
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