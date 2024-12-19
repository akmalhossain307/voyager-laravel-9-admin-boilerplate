<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">


    <title>{{ config('app.name', 'Laravel') }}</title>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="{{asset('assets/plugins/fontawesome-free/css/all.min.css')}}"> 
   
     <!-- DataTables -->
    <link rel="stylesheet" href="{{asset('assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
  <link rel="stylesheet" href="{{asset('assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">
   <link rel="stylesheet" href="{{asset('assets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css')}}">

<!-- jQuery UI CSS (for draggable and resizable) -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">



  <link rel="stylesheet" href="{{ asset('assets/plugins/toastr/toastr.min.css') }}">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.0/dist/sweetalert2.min.css">
   <!-- Theme style -->
   <link rel="stylesheet" href="{{asset('assets/dist/css/adminlte.min.css')}}">  



 
<!-- <link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="{{ asset('assets/dist/css/adminlte.min.css') }}" rel="stylesheet"> -->

</head>
<body class="hold-transition sidebar-mini layout-fixed">

<div class="wrapper">

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button">
                <i class="fas fa-bars"></i>
            </a>
        </li>
    </ul>

    <ul class="navbar-nav ml-auto">
        <!-- Live Clock and Date Section -->
        <li class="nav-item" style="font-weight:bold">
            <span id="liveClock" class="nav-link"></span>
        </li>
        <!-- User Profile and Logout Section -->
        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
                <i class="fas fa-user-circle"></i> <!-- User Icon -->
                <span class="d-none d-md-inline">
                {{ auth()->user()->name }}
                </span> <!-- User's Name -->
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <a href="#" class="dropdown-item">
                    <i class="fas fa-user nav-icon"></i> Profile
                </a>
                <a href="/logout" class="dropdown-item">
                    <i class="fas fa-sign-out-alt nav-icon"></i> Logout
                </a>
            </div>
        </li>
    </ul>
</nav>



<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{url('/')}}" class="brand-link">
        <img src="{{ asset('assets/img/logo.png') }}" alt="Promiti Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light"> ERP</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
     

    </div>
    <!-- /.sidebar -->
  </aside>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Dashboard</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">Dashboard</li>
                </ol>
            </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
        </div>

<!-- Main content -->
<div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-12">
            
            <div class="card card-primary card-outline">
              <div class="card-header">
                <h5 class="m-0">Welcome</h5>
              </div>
              <div class="card-body">
                <h6 class="card-title">Welcome to PROMITI Dashboard</h6>
              </div>
            </div>
          </div>
          <!-- /.col-md-12 -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
        
    </div>

    <!-- Footer -->
    <footer class="main-footer">
        <div class="float-right d-none d-sm-inline">
            Tailoring Data for you!
        </div>
        <strong>Copyright &copy; {{ date('Y') }} <a href="https://www.promiti.com/" target="_blank">Promiti</a>.</strong> All rights reserved.
    </footer>


<!-- jQuery -->
    <script src="{{asset('assets/plugins/jquery/jquery.min.js')}}"></script>
<!-- Bootstrap 4 -->
    <script src="{{asset('assets/plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
<!-- DataTables  & Plugins -->   
    <script src="{{ asset('assets/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
    <script src="{{asset('assets/plugins/datatables-buttons/js/dataTables.buttons.min.js')}}"></script>
    <script src="{{asset('assets/plugins/datatables-buttons/js/buttons.bootstrap4.min.js')}}"></script>
    <script src="{{asset('assets/plugins/jszip/jszip.min.js')}}"></script>
    <script src="{{asset('assets/plugins/pdfmake/pdfmake.min.js')}}"></script>
    <script src="{{asset('assets/plugins/pdfmake/vfs_fonts.js')}}"></script>
    <script src="{{asset('assets/plugins/datatables-buttons/js/buttons.html5.min.js')}}"></script>
    <script src="{{asset('assets/plugins/datatables-buttons/js/buttons.print.min.js')}}"></script>
    <script src="{{asset('assets/plugins/datatables-buttons/js/buttons.colVis.min.js')}}"></script>

    <!-- jQuery UI JS (required for draggable and resizable) -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

    <script src="{{ asset('assets/plugins/toastr/toastr.min.js') }}"></script>
    
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.0/dist/sweetalert2.min.js"></script>

    <!-- AdminLTE App -->
    <script src="{{asset('assets/dist/js/adminlte.min.js')}}"></script>
<!-- AdminLTE for demo purposes -->
   <!-- <script src="{{asset('assets/dist/js/demo.js')}}"></script> -->

   <script type="text/javascript">
    @if(session('success'))
        toastr.success("{{ session('success') }}");
    @elseif(session('error'))
        toastr.error("{{ session('error') }}");
    @endif
 </script>

    <script>
        // Add collapse functionality using jQuery for nested menus
        $(document).ready(function() {
            $('.nav-link[data-toggle="collapse"]').on('click', function () {
                var target = $(this).data('target');
                $(target).collapse('toggle');
            });

        });
    </script>
  


     <script>
    function updateClock() {
        const now = new Date();

        // Convert the current time to Bangladesh Standard Time (BST)
        const options = {
            timeZone: 'Asia/Dhaka',
            year: 'numeric',
            month: 'short', // Use abbreviated month (e.g., "Nov")
            day: 'numeric',
            weekday: 'long', // Full day name (e.g., "Thursday")
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit',
            hour12: true, // 12-hour format with AM/PM
        };

        // Create a DateTimeFormat object for English (Bangladesh)
        const dateTimeFormat = new Intl.DateTimeFormat('en-BD', options);

        // Format the current time and date
        const formattedDateTime = dateTimeFormat.format(now);

        // Set the live clock and date in the navbar
        document.getElementById('liveClock').textContent = formattedDateTime;
    }

    // Update the clock every 1000 milliseconds (1 second)
    setInterval(updateClock, 1000);

    // Initial call to display the clock immediately when the page loads
    updateClock();
</script>
</body>
</html>
