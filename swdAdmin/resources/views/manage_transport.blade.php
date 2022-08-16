@extends('layout')
@section('title','Manage Transport')

@section('transport_select','active')
   
@section('container')
<h1>Manage_Transport</h1>
<a href="{{url('admin/transport')}}">
    <button type="button" class="btn btn-success">Back</button>
    </a>
 <div class="row mt-2">
            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                    <form action="{{route('transport.manage_transportprocess')}}" method="post" enctype="multipart/form-data">
                                            @csrf
                                <div class="form-group">
                                     <div class="row">
                                        <div class="col-md-4">
                                        <label for="name" class="control-label mb-1"> Vehical</label>
                                        <input id="name" name="name" type="text" class="form-control" value="{{$vehicalname}}" required>
                                        
                                        </div>
                            <div class="col-md-4">
                               <label for="dname" class="control-label mb-1">Driver Name</label>
                                <input id="dname" name="dname" type="text" class="form-control"  value="{{$drivername}}"
                                onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)" required>
                            </div>
                            <div class="col-md-4">
                               <label for="dphone" class="control-label mb-1">Driver Phone no.</label>
                                <input id="dphone" name="dphone" type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control"  value="{{$driverPhone}}" placeholder="03XZ-YYYYYYY" required>
                                @error('driverPhone')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                            {{ $message }}
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                                            @enderror
                            </div>
                            <div class="col-md-4">
                               <label for="vno" class="control-label mb-1">Vehical No.</label>
                                <input id="vno" name="vno" type="text" class="form-control"  value="{{$vehicalnumber}}" required>
                            </div>

                            
                                
                <div class="col-md-4">
                                    
                               <label for="fid" class="control-label mb-1">Franchise </label>
                               <select name="fid" id="fid" class="form-control" >
                    <option value="">Select Franchise</option>
                     @foreach ($franchise as $option)
                     
                     @if($fid==$option->id)
                     <option selected value="{{$fid}}">
                        @else
                    <option  value="{{$option->id}}">
                        @endif 
                        {{$option->name}}
                    </option>
                    @endforeach 
                 </select> @error('fid')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                            {{ $message }}
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                                            @enderror
                                       

                
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