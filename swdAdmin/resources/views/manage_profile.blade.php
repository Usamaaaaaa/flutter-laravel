@extends('layout')
@section('title','Manage Profile')
   
@section('container')
<h1>Manage_Profile</h1>
<a href="{{url('admin/profile')}}">
    <button type="button" class="btn btn-success">Back</button>
    </a>
 <div class="row mt-2">
            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                    <form action="{{route('profile.manage_profileprocess')}}" method="post" enctype="multipart/form-data">
                                            @csrf
                                <div class="form-group">
                                     <div class="row">
                                        <div class="col-md-4">
                                        <label for="name" class="control-label mb-1">Service Name</label>
                                        <input id="name" name="name" type="text" class="form-control"   >
                                        {{-- @error('name')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                            {{ $message }}
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                                            @enderror --}}
                                        </div>
                                <div class="col-md-4">
                                    
                               <label for="category" class="control-label mb-1">Category </label>
                               <select name="category" id="category" class="form-control">
                    <option value="">Select Category</option>
                     {{-- @foreach ($categorylist as $option)
                     
                     @if($category==$option)
                     <option selected value="{{$category}}">
                        @else
                    <option  value="{{$option}}">
                        @endif 
                        {{$option}}
                    </option>
                    @endforeach  --}}
                 {{-- </select> @error('category')
                                        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                            {{ $message }}
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            </div>
                                            @enderror --}}
                                       

                
                                </div>
                                
                                <div class="col-md-4">
                               <label for="Price" class="control-label mb-1">Price </label>
                                                <input id="price" name="price" type="text" class="form-control"  value=""
                                                 >
                                               
                                </div>
                                </div>
                                </div>

                  <div class="form-group">
                                               
                <label for="image" class="control-label mb-1">Image</label>
                <input id="image" name="image" type="file" class="form-control"  value="" required>
                 {{-- @if ($image!="") 
                    
                <img width="100px" src="{{asset('storage/media/service/'.$image)}}" alt="image" > 
                 @endif  --}}
                </div><br>

                <div class="form-group">
                                               
                <label for="description">Description</label>
                <textarea class="form-control" name="description" id="description" cols="30" rows="5"  ></textarea>
                 {{-- @error('description')
                 <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                {{ $message }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                </div>
                 @enderror
                                        --}}
                </div>
                <div>
                <button id="submitbutton" type="submit" class="btn btn-lg btn-info btn-block">Submit</button>
                                            </div>
                                            <input type="hidden" name="id" value="">
                                        </form>
                                    </div>
                                    </div>
                                </div>
                            </div>                   
@endsection