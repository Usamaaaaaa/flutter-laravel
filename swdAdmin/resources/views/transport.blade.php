@extends('layout')
@section('title','Transport')
@section('transport_select','active')
    
@section('container')
    <h1>Transport</h1>
    <a href="{{url('admin/transport/manage_transport')}}">
    <button type="button" class="btn btn-success">Add Transport</button>
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
                        {{-- <th>ID</th> --}}
                        <th>Delivery van</th>
                        <th>Driver</th>
                        <th>D. Phone</th>
                        <th>Van no.</th>
                        
                        <th>Franchise</th>
                        <th>Action</th>
                        
                        </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($transports as $t)
                                                <tr>
                                                {{-- <td>{{$t->id}}</td> --}}
                                                <td>{{$t->vehicalname}}</td>
                                                <td>{{$t->drivername}}</td>
                                                <td>{{$t->driverPhone}}</td>
                                                <td>{{$t->vehicalnumber}}</td>
                                                @foreach ($fran as $k=>$f)
                                                    @if ($t->franchise_id==$f->id)
                                                    <td>{{$f->name}}</td>
                                                    {{-- <td>hh</td> --}}
                                                    @endif
                                                @endforeach
         
                                                <td>
                                                    
                                                    <a href="{{url('admin/transport/delete/')}}/{{$t->id}}" class="btn btn-danger">Delete</a>

                                                    <a href="{{url('admin/transport/manage_transport/')}}/{{$t->id}}" class="btn btn-warning">Edit</a>
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