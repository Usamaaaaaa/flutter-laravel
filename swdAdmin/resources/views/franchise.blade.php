@extends('layout')
@section('title','Franchise')
@section('franchise_select','active')
    
@section('container')
    <h1>Franchise</h1>
    <a href="{{url('admin/franchise/manage_franchise')}}">
    <button type="button" class="btn btn-success">Add Franchise</button>
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
                        <th>Franchise Name</th>
                        {{-- <th>Email</th> --}}
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Contract Date</th>
                        <th>Action</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                                            @foreach ($franchises as $franchise)
                                                <tr>
                                                <td>{{$franchise->id}}</td>
                                                <td>{{$franchise->name}}.({{$franchise->code}})</td>
                                                <td>{{$franchise->phone}}</td>
                                                <td>{{$franchise->address}}</td>
                                                <td>{{$franchise->regdate}}</td>
                                                <td>
                                                    <a href="{{url('admin/franchise/delete/')}}/{{$franchise->id}}" class="btn btn-danger">Delete</a>

                                                    <a href="{{url('admin/franchise/manage_franchise/')}}/{{$franchise->id}}" class="btn btn-warning">Edit</a>
                                                </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                <!-- END DATA TABLE-->
                            </div>
                        </div>
@endsection