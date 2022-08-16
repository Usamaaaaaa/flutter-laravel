@extends('layout')
@section('title','Category')
@section('category_select','active')
    
@section('container')
    <h1>Category</h1>
    <a href="{{url('admin/category/manage_category')}}">
    <button type="button" class="btn btn-success">Add Category</button>
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
                        <th>Service Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Description</th>
                        <th>Action</th>
                        
                        </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($categorys as $cat)
                                                <tr>
                                                <td>{{$cat->id}}</td>
                                                <td>{{$cat->name}}</td>
                                                <td>{{$cat->category}}</td>
                                                <td>{{$cat->price}}</td>
                                                <td>{{ \Illuminate\Support\Str::limit($cat->description, 25, $end='...') }}</td>
                                                <td>
                                                    
                                                    <a href="{{url('admin/category/delete/')}}/{{$cat->id}}" class="btn btn-danger">Delete</a>

                                                    <a href="{{url('admin/category/manage_category/')}}/{{$cat->id}}" class="btn btn-warning">Edit</a>
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