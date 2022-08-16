@extends('layout')
@section('title','Manage Franchise')

@section('franchise_select','active')
   
@section('container')
<h1>Manage_Franchise</h1>
<a href="{{url('admin/franchise')}}">
    <button type="button" class="btn btn-success">Back</button>
    </a>
<div class="row mt-2">
<div class="col-lg-12">
    <div class="card">
        <div class="card-body">
            <form action="{{route('franchise.manage_franchiseprocess')}}" method="post" enctype="multipart/form-data">
                                            @csrf
    <div class="form-group">
        <div class="row">
            <div class="col-md-4">
                <label for="name" class="control-label mb-1">Franchise Name</label>
                <input id="name" name="name" type="text" class="form-control"  
                value="{{$name}}" >
                @error('name')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                          <small>{{ $message }} </small>  
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                                            @enderror
            </div>
            <div class="col-md-4">
                <label for="email" class="control-label mb-1">Email</label>
                <input id="email" name="email" type="email" class="form-control"  value="{{$email}}" required >
                @error('email')
                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                          <small> {{ $message }} </small>   
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                                            @enderror
            </div>
            <div class="col-md-4">
                <label for="phone" class="control-label mb-1">Phone</label>
                <input id="phone" name="phone" type="phone"
                onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control" 
                value="{{$phone}}"  placeholder="03XZ-YYYYYYY">
                @error('phone')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                    
                                          <small> {{ $message }} </small>   
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                 @enderror
            </div>
            <div class="col-md-4">
                <label for="address" class="control-label mb-1">Address</label>
                <input id="address" name="address" type="text" class="form-control"  
                value="{{$address}}">
                @error('address')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                          <small>   {{ $message }}</small>
                                          
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                 @enderror
                                               
            </div>
            
                                                {{-- onkeypress='return event.charCode >= 48 && event.charCode <= 57' --}}
            
            <div class="col-md-4">
                <label for="code" class="control-label mb-1">Code </label>
                
                <input type="text" name="code" id="code" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'  value="{{$code}}" placeholder="only numeric value allow">
                @error('code')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                           
                                          <small>  {{ $message }}    </small>    
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                 @enderror
            </div>

            <div class="col-md-4">
                <label for="address" class="control-label mb-1">Contract date</label>
                {{-- <input id="rdate" name="rdate" type="text" class="form-control"  value=""><br> --}}<br>
                <input type="date" name="rdate" id="rdate" value="{{$rdate}}" required>
            </div>
           
         </div></div>
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