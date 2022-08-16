<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Title Page-->
    <title>@yield('title')</title>

    <!-- Fontfaces CSS-->
    <link href="{{asset('css/font-face.css')}}" rel="stylesheet" media="all">
    <link href="{{asset('vendor/font-awesome-4.7/css/font-awesome.min.css')}}" rel="stylesheet" media="all">
    <link href="{{asset('vendor/font-awesome-5/css/fontawesome-all.min.css')}}" rel="stylesheet" media="all">
    <link href="{{asset('vendor/mdi-font/css/material-design-iconic-font.min.css')}}" rel="stylesheet" media="all">
    {{-- <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css"> --}}

    <!-- Bootstrap CSS-->
    <link href="{{asset('vendor/bootstrap-4.1/bootstrap.min.css')}}" rel="stylesheet" media="all">
    
    <!-- Vendor CSS-->
    <link href="{{asset('vendor/animsition/animsition.min.css')}}" rel="stylesheet" media="all">
    <link href="{{asset('vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css')}}" rel="stylesheet" media="all">
    <link href="{{asset('vendor/wow/animate.css')}}" rel="stylesheet" media="all">
    <link href="{{asset('vendor/css-hamburgers/hamburgers.min.css')}}" rel="stylesheet" media="all">
    <link href="{{asset('vendor/slick/slick.css')}}" rel="stylesheet" media="all">
    <link href="{{asset('vendor/select2/select2.min.css')}}" rel="stylesheet" media="all">
    <link href="{{asset('vendor/perfect-scrollbar/perfect-scrollbar.css')}}" rel="stylesheet" media="all">
    <!-- Main CSS-->
    <link href="{{asset('css/theme.css')}}" rel="stylesheet" media="all">

</head>

<body >
      <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <header class="header-mobile d-block d-lg-none">
    <div class="header-mobile__bar">
            <div class="container-fluid">
                <div class="header-mobile-inner">
              <a class="logo" href="index.html">
                <img src="{{asset('images/Swdlogo.jpeg')}}" alt="SWDAdminImage" 
                style="border-radius:50px" 
                    height="50px" width="50px"/>
              </a>
              <button class="hamburger hamburger--slider" type="button">
                <span class="hamburger-box">
                  <span class="hamburger-inner"></span>
                </span>
              </button>
            </div>
        </div>
    </div>
    
        <nav class="navbar-mobile">
          <div class="container-fluid">
                    <ul class="list-unstyled navbar__list">
                       <li class="@yield('category_select')" >
                            <a  href="{{url('admin/dashboard')}}">
                                <i class="fa fa-tachometer-alt mr-3"></i>Dashboard</a>
                        </li>
                        <li >
                            <a  href="{{url('admin/category')}}">
                                <i class="fas fa-tachometer-alt mr-3"></i>Category</a>
                        </li>
                         <li>
                            <a  href="{{url('admin/coupon')}}">
                                <i class="fas fa-tachometer-alt mr-3"></i>Service</a>
                        </li>
                        <li>
                            <a  href="{{url('admin/banner')}}">
                                <i class="fas fa-tachometer-alt mr-3"></i>Franchises</a>
                        </li>
                    </ul>
          </div></nav>
        </header>
        <!-- END HEADER MOBILE-->

        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="#">
                    <img src="{{asset('images/Swdlogo.jpeg')}}" alt="Cool Admin" style="border-radius:50px" 
                    height="50px" width="50px"
                    />
                </a>
                <h2 class="pl-2">SWD</h2>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li class="@yield('dashboard_select')">
                            <a  href="{{url('admin/dashboard')}}">
                                <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                        </li>
                        <li class="@yield('category_select')">
                            <a  href="{{url('admin/category')}}">
                                <i class="fas fa-list"></i>Category</a>
                        </li>
                        @if (Session::has('isfranchise'))
                           <li class="@yield('order_select')">
                            <a  href="{{url('franchise/order')}}">
                                <i class="fas fa-window-maximize"></i>Orders</a>
                        </li>
                        
                        @else
                        
                         <li class="@yield('franchise_select')">
                            <a  href="{{url('admin/franchise')}}">
                                <i class="fas fa-code-branch"></i>
                                Franchises</a>
                        </li>
                            <li class="@yield('booking_select')">
                            <a  href="{{url('admin/booking')}}">
                                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                    Bookings</a>
                        </li>
                        </li>
                            <li class="@yield('collect_select')">
                            <a  href="{{url('admin/collections')}}"><i class="fa fa-solid fa-calculator"></i>
                                Collections</a>
                        </li>
                        
                        </li>
                            <li class="@yield('report_select')">
                            <a  href="{{url('admin/report')}}">
                                <i class="fas fa-window-maximize"></i>Report</a>
                        </li>
                        
                        @endif
                        
                          <li class="@yield('employee_select')">
                            <a  href="{{url('admin/employee')}}">
                        <i class="fas fa-users"></i>
                            Employees</a>
                        </li>

                        {{-- <li class="@yield('customer_select')">
                            <a  href="{{url('admin/customer')}}">
                            <i class="fas fa-paint-brush"></i>Customer</a>
                        </li> --}}
                          <li class="@yield('transport_select')">
                            <a  href="{{url('admin/transport')}}">
                            <i class="fa fa-ambulance"></i>
                            Transport</a>
                        </li>
                        
                        <li class="@yield('profile_select')">
                            <a  href="{{url('admin/profile')}}">
                                <i class="fas fa-tachometer-alt"></i>Profile</a>
                        </li>
                        
                        <li >
                            <a href="{{url('admin/logout')}}"> <i class="zmdi zmdi-power"></i>Logout</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <form class="form-header" action="" method="POST">
                            </form>
                             <div class="header-button">
                  
                  <div class="account-wrap">
                    <div class="account-item clearfix js-item-menu">
                      <!-- <div class="image">
                                            <img src="images/icon/avatar-01.jpg" alt="John Doe" />
                                        </div> -->
                      <div class="content">
                        @if (Session::has('isfranchise'))
                            
                        <a class="js-acc-btn" href="#">{{Session::get('isfranchise')}}</a>
                        @else
                        <a class="js-acc-btn" href="#">Admin</a>
                        @endif
                      </div>
                      <div class="account-dropdown js-dropdown">
                        
                        <div class="account-dropdown__footer">
                          <a href="{{url('admin/logout')}}"> <i class="zmdi zmdi-power"></i>Logout</a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              
                        
                        
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        @section('container')
                            
                                    @show
                        
                       
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright © 2018 SWD. All rights reserved. Template by <a href="#">SharpD</a>.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>
</div>



    <!-- Jquery JS-->
    <script src="{{asset('vendor/jquery-3.2.1.min.js')}}"></script>
    <!-- Bootstrap JS-->
    <script src="{{asset('vendor/bootstrap-4.1/popper.min.js')}}"></script>
    <script src="{{asset('vendor/bootstrap-4.1/bootstrap.min.js')}}"></script>
    <script src="{{asset('vendor/wow/wow.min.js')}}"></script>
    

    <!-- Main JS-->
    <script src="{{asset('js/main.js')}}"></script>
     <script src="{{asset('vendor/slick/slick.min.js')}}">
    </script>
    <script src="{{asset('vendor/wow/wow.min.js')}}"></script>
    <script src="{{asset('vendor/animsition/animsition.min.js')}}"></script>
    <script src="{{asset('vendor/bootstrap-progressbar/bootstrap-progressbar.min.js')}}">
    </script>
    <script src="{{asset('vendor/counter-up/jquery.waypoints.min.js')}}"></script>
    <script src="{{asset('vendor/counter-up/jquery.counterup.min.js')}}">
    </script>
    <script src="{{asset('vendor/circle-progress/circle-progress.min.js')}}"></script>
    <script src="{{asset('vendor/perfect-scrollbar/perfect-scrollbar.js')}}"></script>
    <script src="{{asset('vendor/chartjs/Chart.bundle.min.js')}}"></script>
    <script src="{{asset('vendor/select2/select2.min.js')}}">
    </script>


</body>

</html>
<!-- end document-->