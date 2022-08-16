@extends('layout')
@section('title','Profile')
@section('profile_select','active')
    
@section('container')
    <h1>Profile</h1>
    
    <div class="row m-t-30">
        <div class="col-md-12">
                                <!-- DATA TABLE-->
            <div class="table-responsive m-b-40">
                <table class="table table-borderless table-data3">
                        <thead>
                        <tr>
                        <th>ID</th>
                        <th>Cust. Name</th>
                        <th>Membership status</th>
                        <th>image</th>
                        <th>Date</th>
                        <th>Action</th>
                        
                        </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($profiles as $profile)
                                            @foreach ($users as $user)
                                                @if ($profile->user_registration_id==$user->id)
                                                    
                                            <tr>
                                                <td>{{$profile->id}}</td>
                                                <td>{{$user->Firstname.' '.$user->Lastname}}</td>
                                                <td>
                                                    @if ($profile->membership==null)
                                                        {{'Not a member'}}
                                                    @else
                                                        {{$profile->membership}}
                                                    @endif
                                                </td>
                                                <td>@if ($profile->image!="") 
                    
                                                  <img width="50px" height="50px" src="{{asset('storage/media/profile/'.$profile->image)}}" alt="image" >
                                                  @else 
                                                  {{'No image found'}}
                                                 @endif </td>
                                                 @if ($profile->membership!=null)
                                                     <td>{{$profile->date}}</td>
                                                 @else
                                                    <td>nil</td>
                                                 @endif
                                                 {{-- <td></td> --}}
                                                <td>
                                                   @if ($profile->status==1)
                                                    <a href="{{url('profile/status/0')}}/{{$profile->id}}" class="btn btn-primary">Member</a>
                                                    @elseif($profile->status==0 ||$profile->status==null)
                                                    
                                                    <a href="{{url('profile/status/1')}}/{{$profile->id}}" class="btn btn-warning">Not a member</a>
                                                   @endif 

                                                    {{-- <a href="{{url('admin/category/delete/')}}/{{$list->id}}" class="btn btn-danger">Delete</a>

                                                    <a href="{{url('admin/category/manage_category/')}}/{{$list->id}}" class="btn btn-warning">Edit</a> --}}
                                                   
                                                </td>

                                            </tr>
                                            
                                                @endif
                                            @endforeach
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                <!-- END DATA TABLE-->
                            </div>
                        </div>
@endsection