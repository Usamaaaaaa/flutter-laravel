@extends('layout')
@section('title','Manage Employee')

@section('employee_select','active')
   
@section('container')
<h1>Manage_Employee</h1>
<a href="{{url('admin/employee')}}">
    <button type="button" class="btn btn-success">Back</button>
    </a>
 <div class="row mt-2">
            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                    <form action="{{route('employee.manage_employeeprocess')}}" method="post" enctype="multipart/form-data">
                                            @csrf
                                <div class="form-group">
                                     <div class="row">
                                        <div class="col-md-4">
                                        <label for="name" class="control-label mb-1"> Name</label>
                                        <input id="name" name="name" type="text" class="form-control" value="{{$name}}"
                                        onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)" required >
                                        @error('name')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                            {{ $message }}
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                                            @enderror
                                        </div>
                                <div class="col-md-4">
                                    
                               <label for="phone" class="control-label mb-1">Phone </label>
                                <input id="phone" name="phone" type="text" 
                                onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control"  value="{{$phone}}" required placeholder="03XZ-YYYYYYY">
                                
                                        @error('phone')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                            {{ $message }}
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                                            @enderror
                               
                
                                </div>
                                
                                <div class="col-md-4">
                                    
                               <label for="address" class="control-label mb-1">Address </label>
                                <input id="address" name="address" type="text" 
                                 class="form-control"  value="{{$address}}" required>
                                </div>
                                
                                <div class="col-md-4">
                                    
                               <label for="desg" class="control-label mb-1">Status </label>
                                <input id="desg" name="desg" type="text" class="form-control"  value="{{$desg}}" required>
                                </div>
                                <div class="col-md-4">
                                    
                               <label for="sal" class="control-label mb-1">Salary </label>
                                <input id="sal" name="sal" type="text" 
                                onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control"  value="{{$sal}}" 
                                placeholder="only numeric digit allow" required>
                                @error('sal')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                            {{ $message }}
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                                            @enderror
                                </div>
                                
                                <div class="col-md-4">
                                    
                               <label for="email" class="control-label mb-1">Email </label>
                                <input id="email" name="email" type="email" class="form-control"  value="{{$email}}" required>
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