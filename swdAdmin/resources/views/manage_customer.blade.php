@extends('layout')
@section('title','Manage Customer')
   
@section('container')
<h1>Manage_Customer</h1>
<a href="{{url('admin/customer')}}">
    <button type="button" class="btn btn-success">Back</button>
    </a>
 <div class="row mt-2">
            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                    <form action="{{route('customer.manage_customerprocess')}}" method="post" enctype="multipart/form-data">
                                            @csrf
                                <div class="form-group">
                                     <div class="row">
                                        <div class="col-md-4">
                                        <label for="name" class="control-label mb-1"> Name</label>
                                        <input id="name" name="name" type="text" class="form-control"  value="{{$name}}" >
                                        {{-- @error('name')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                            {{ $message }}
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                                            @enderror --}}
                                        </div>
                                
                                <div class="col-md-4">
                               <label for="email" class="control-label mb-1">Email </label>
                                <input id="email" name="email" type="text" class="form-control"  value="{{$email}}"
                                                 >
                                                 @error('email')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                            {{ $message }}
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                                            @enderror
                                               
                                </div>
                                
                                <div class="col-md-4">
                               <label for="phone" class="control-label mb-1">Phone </label>
                                <input id="phone" name="phone" type="text" class="form-control"  value="{{$phone}}"
                                                 >
                                    @error('phone')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                            {{ $message }}
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                                            @enderror
                                               
                                </div>
                                <div class="col-md-6">                        
                <label for="address">Address</label>
                <input id="address" name="address" type="text" class="form-control"  value="{{$address}}"></div>
                
                 {{-- @error('description')
                 <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                {{ $message }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                </div>
                 @enderror
                                        --}}
                </div>
                                </div>
                                </div>
                <div>
                <button id="submitbutton" type="submit" class="btn btn-lg btn-info btn-block">Submit</button>
                                            </div>
                                            <input type="hidden" name="id" value="{{$id}}">
                                        </form>
                                    </div>
                                    </div>
                                </div>
                            </div>                   
@endsection