@extends('layout')
@section('title','Manage Booking')
   
@section('container')
<h1>Assgin_Booking</h1>
<a href="{{url('admin/booking')}}">
    <button type="button" class="btn btn-success">Back</button>
    </a>
 <div class="row mt-2">
            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                    <form action="{{route('booking.manage_bookingprocess')}}" method="post" enctype="multipart/form-data">
                                            @csrf
                                <div class="form-group">
                                     <div class="row">
                                        <div class="col-md-4">
                                        <label for="name" class="control-label mb-1">Customer Name</label>
                                        <input id="name" name="name" type="text" class="form-control" value="{{$name}}"  >
                                        @error('name')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                            {{ $message }}
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                                            @enderror
                                        </div>
                                
                                
                                
                <div class="col-md-4">
                                    
                               <label for="franchise" class="control-label mb-1">Franchise </label>
                               <select name="franchise" id="franchise" class="form-control">
                    <option value="">Select Franchise</option>
                     @foreach ($franchises as $option)
                     <option value="{{$option->name}}">
                    
                        {{$option->name}}
                    </option>
                    @endforeach 
                 </select> @error('franchise')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                            {{ $message }}
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                                            @enderror
                                       

                
                                </div>
                                
                                <div class="col-md-4">
                               <label for="total" class="control-label mb-1">Total </label>
                                                <input id="total" name="total" type="text" class="form-control"  value="{{$total}}" readonly>
                                                  @error('total')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                            {{ $message }}
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                                            @enderror
                                       
                                </div>
                                </div>
                                </div>

                <br>

                <div class="form-group">
                                               
                <label for="paytype">Payment Method</label>
                <input id="paytype" name="paytype" type="text" class="form-control"  value="{{$paytype}}" readonly>
                 @error('paytype')
                 <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                {{ $message }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                </div>
                 @enderror
                                       
                </div>
                <div>
                <button id="submitbutton" type="submit" class="btn btn-lg btn-info btn-block">Submit</button>
                                            </div>
                                            <input type="hidden" name="id" value="{{$id}}">
                                            <input type="hidden" name="uid" value="{{$userid}}">
                                            <input type="hidden" name="tid" value="{{$torder}}">
                                        </form>
                                    </div>
                                    </div>
                                </div>
                            </div>                   
@endsection