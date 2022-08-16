@extends('layout')
@section('title','Employee')
@section('employee_select','active')
    
@section('container')
    <h1>Employee</h1>
    <a href="{{url('admin/employee/manage_employee')}}">
    <button type="button" class="btn btn-success">Add Employee</button>
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
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>As A.</th>
                        <th>Salary</th>
                        <th>Action</th>
                        
                        </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($employees as $emp)
                                                <tr>
                                                <td>{{$emp->id}}</td>
                                                <td>{{$emp->name}}</td>
                                                <td>{{$emp->phone}}</td>
                                                <td>{{$emp->address}}</td>
                                                <td>{{$emp->designation}}</td>
                                                <td>{{$emp->salary}}</td>
                                                <td>
                                                    
                                                    <a href="{{url('admin/employee/delete/')}}/{{$emp->id}}" class="btn btn-danger">Delete</a>

                                                    <a href="{{url('admin/employee/manage_employee/')}}/{{$emp->id}}" class="btn btn-warning">Edit</a>
                                                </td>
                                                </tr>
                                            @endforeach
                                            {{-- @foreach ($data as $list)
                                            <tr>
                                                <td>{{$list->id}}</td>
                                                <td>{{$list->category_name}}</td>
                                                <td>{{$list->category_slug}}</td>
                                                <td>
                                                   @if ($list->status==1)
                                                    <a href="{{url('admin/category/status/0')}}/{{$list->id}}" class="btn btn-primary">Active</a>
                                                    @elseif($list->status==0)
                                                    
                                                    <a href="{{url('admin/category/status/1')}}/{{$list->id}}" class="btn btn-warning">Dactive</a>
                                                   @endif 

                                                    <a href="{{url('admin/category/delete/')}}/{{$list->id}}" class="btn btn-danger">Delete</a>

                                                    <a href="{{url('admin/category/manage_category/')}}/{{$list->id}}" class="btn btn-warning">Edit</a>
                                                   
                                                </td>

                                            </tr>
                                            @endforeach --}}
                                        </tbody>
                                    </table>
                                </div>
                                <!-- END DATA TABLE-->
                            </div>
                        </div>
@endsection