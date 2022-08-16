@extends('layout')
@section('title','Dashboard')
@section('dashboard_select','active')
    
@section('container')
{{-- <div class="main-content"> --}}
       {{-- <h1>Dashboard</h1> --}}
                {{-- <div class="section__content section__content--p10"> --}}
                    {{-- <div class="container-fluid"> --}}
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">overview</h2>
                                </div>
                            </div>
                        </div>

                        <div class="row m-t-25">
                            @if (Session::has('isadmin'))
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c1">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-shopping-cart"></i>
                                            </div>
                                            <div class="text">
                                                    
                                                <h2>{{$assignordercount}}</h2>
                                                <span>Booking Assign</span>
                                            
                                                
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart1"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endif
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c2">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-shopping-cart"></i>
                                            </div>
                                            <div class="text">
                                                @if(Session::has('isadmin'))
                                                <h2>{{$ordercount}}</h2>
                                                <span>Bookings</span>
                                                @else 
                                                <h2>{{$ordercount}}</h2>
                                                <span>Orders</span>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart2"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c3">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-calendar-note"></i>
                                            </div>
                                            <div class="text">
                                                <h2>{{$totalfranchise}}</h2>
                                                <span>Franchise</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart3"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c4">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-money"></i>
                                            </div>
                                            <div class="text">
                                                
                                                @if(Session::has('isadmin')) 
                                                <span>On Delivery Total</span>
                                                <h2>{{$total}}</h2>
                                                <span>Online Total</span>
                                                <h2>{{$ototal}}</h2>
                                                @else
                                                <span>Total Collection</span>
                                                <h2>{{$total}}</h2>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart4"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {{-- </div> --}}
                {{-- </div> --}}
            {{-- </div> --}}

                      
@endsection