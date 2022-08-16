@php
    use Illuminate\Support\Facades\URL;
@endphp
@extends('layout')
@section('title','Collections')
@section('collect_select','active')
    
@section('container')
    <h1>Collection Detail</h1>
    <a href="{{Url::previous()}}">
    <button type="button" class="btn btn-success">Back</button>
    </a>
    <div class="row m-t-30">
        <div class="col-md-12">
                                <!-- DATA TABLE-->
            <div class="table-responsive m-b-40">
                <table class="table table-borderless table-data3">
                        <thead>
                        <tr>
                        <th>ID</th>
                        <th>Franchise</th>
                        <th>Total</th>
                        <th>Action</th>
                        
                        </tr>
                                        </thead>
                                        <tbody>
                                            @php
                                                $count=0
                                            @endphp
                                            @foreach ($franchise as $f)
                                            @if ($f->total!="")
                                                <tr>
                                                    <td>
                                                        {{ ++$count
                                                        }}
                                                    </td>
                                                    <td>{{$f->name}}</td>
                                                    <td>{{$f->total}}</td>
                                                    <td>
                                                        
                                                    <a href="{{url('admin/collection/clear')}}/{{$f->id}}" class="btn btn-danger">Clear</a>
                                                    </td>

                                                </tr>
                                                
                                            @endif
                                            @endforeach
                                           
                                        </tbody>
                                    </table>
                                </div>
                                <!-- END DATA TABLE-->
                            </div>
                        </div>
@endsection