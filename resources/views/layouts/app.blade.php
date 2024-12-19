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
            <a class="nav-link" data-widget="pushmenu" id="toggleSidebarBtn" href="#" role="button">
                <i class="fas fa-bars" id="sidebarOpenIcon"></i> <!-- Open icon -->
                <i class="fas fa-times d-none" id="sidebarCloseIcon"></i> <!-- Close icon (hidden initially) -->
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
                    <?php if(auth()->user()){?>
                    {{ auth()->user()->name }}
                    <?php }?>
                </span> <!-- User's Name -->
            </a>
            <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right" style="text-align:center">
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





<?php 
use TCG\Voyager\Models\Permission;
use TCG\Voyager\Models\Menu;
use TCG\Voyager\Models\MenuItem;
use TCG\Voyager\Contracts\User;
use TCG\Voyager\Facades\Voyager;
    ?>
@php
    // Fetch all menu items ordered by 'order'
    $menuItems = MenuItem::orderBy('order')->get();
    
    // Group menu items by parent_id
    $groupedItems = [];
    foreach ($menuItems as $item) {
        if ($item->parent_id === null) {
            // If parent_id is null, it's a top-level item
            $groupedItems[$item->id] = $item;
        }
    }

    // Assign children to their respective parents
    foreach ($menuItems as $item) {
        if ($item->parent_id !== null) {
            // Find the parent item and assign the current item as a child
            if (isset($groupedItems[$item->parent_id])) {
                $parent = $groupedItems[$item->parent_id];
                if (!isset($parent->children)) {
                    $parent->children = [];
                }
                $parent->children[] = $item;
            }
        }
    }
@endphp

<?php
$user = auth()->user();  // Get the authenticated user
// Check if the user is authenticated (not null)
if (!$user) {
    //abort(401, 'You must be logged in to access this resource.');
    //return redirect()->route('admin/login')->with('error', 'You must be logged in to access this resource.');
    //return redirect()->to('/login');
    echo "<script>window.location.href = '/admin/login';</script>"; // redirect to url
    exit;  // Stop further execution to prevent rendering the page
}
$hasPermission = false;  // Flag to check if the user has any permission
// Loop through the grouped items to check permissions
foreach ($groupedItems as $parent) {
    // Ensure parent permission exists and the user has the permission
    if ($parent->permission && $user->hasPermission($parent->permission)) {
        $hasPermission = true;
        break;  // Exit the loop once permission is found
    }
}
// If no permission is found, abort with a 403 error
if (!$hasPermission) {
    echo "<script>window.location.href = '/no_permission';</script>";
    exit;  // Stop further execution to prevent rendering the page
}  
?>
  
<!-- Sidebar -->
<!-- Sidebar -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="{{url('/')}}" class="brand-link">
        <img src="{{ asset('assets/img/logo.png') }}" alt="Promiti Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light"> ERP</span>
    </a>

    <div class="sidebar">
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            @foreach ($groupedItems as $parent)
    <?php
        // Permission check for the parent item
        $user = auth()->user();
        $hasPermission = $user->hasPermission($parent->permission);
    ?>
    @if ($hasPermission && $parent->permission)
        <li class="nav-item @if(isset($parent->children) && count($parent->children) > 0) menu-is-opening menu-open @endif">
            @if (isset($parent->children) && count($parent->children) > 0)
                <!-- Parent has children, use a collapsible item -->
                <a href="javascript:void(0);" class="nav-link" data-toggle="collapse" data-target="#menu-{{$parent->id}}">
                    <i class="nav-icon fas fa-copy"></i>
                    <p>
                        {{ $parent->title }}
                        <i class="right fas fa-angle-left"></i>
                    </p>
                </a>

                <!-- Child items (collapse) -->
                @php
                    $uniqueChildren = collect($parent->children)->unique('title');
                @endphp
                <ul class="nav nav-treeview collapse" id="menu-{{$parent->id}}">
                    @foreach ($uniqueChildren as $child)
                        <?php
                            $hasPermissionChild = $user->hasPermission($child->permission);
                        ?>
                        @if ($hasPermissionChild && $child->permission)
                            <li class="nav-item @if(isset($child->children) && count($child->children) > 0) menu-is-opening menu-open @endif">
                                <a href="{{ url($child->link()) }}" class="nav-link">
                                    <i class="nav-icon fas fa-copy"></i>
                                    <p>{{ $child->title }}
                                            @if (isset($child->children) && count($child->children) > 0)
                                                    <i class="right fas fa-angle-left"></i>
                                            @endif
                                    </p>
                                </a>
                                @if (isset($child->children) && count($child->children) > 0)
                                    <!-- Grandchild items -->
                                    <ul class="nav nav-treeview">
                                        @foreach ($child->children as $grandchild)
                                            <?php
                                                $hasPermissionGrandchild = $user->hasPermission($grandchild->permission);
                                            ?>
                                            @if ($hasPermissionGrandchild && $grandchild->permission)
                                                <li class="nav-item">
                                                    <a href="{{ url($grandchild->link()) }}" class="nav-link">
                                                        <i class="nav-icon fas fa-copy"></i>
                                                        <p>{{ $grandchild->title }}</p>
                                                    </a>
                                                </li>
                                            @endif
                                        @endforeach
                                    </ul>
                                @endif
                            </li>
                        @endif
                    @endforeach
                </ul>
            @else
                <!-- Parent has no children, make it directly clickable -->
                <a href="{{ url($parent->link()) }}" class="nav-link">
                    <i class="nav-icon fas fa-file"></i>
                    <p>{{ $parent->title }}</p>
                </a>
            @endif
        </li>
    @endif
@endforeach


            </ul>
        </nav>
    </div>
</aside>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        @yield('content')
        
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



        // Handle the sidebar toggle on button click
        $('#toggleSidebarBtn').click(function(e) {
            e.preventDefault(); // Prevent default action of anchor
            // Toggle the sidebar visibility
            $('aside.main-sidebar').toggleClass('toggled'); // Toggle sidebar visibility
            // Toggle the visibility of the icons
            $('#sidebarOpenIcon').toggleClass('d-none'); // Hide the open icon
            $('#sidebarCloseIcon').toggleClass('d-none'); // Show the close icon
        });




        });
    </script>
     <!-- Yield Scripts -->
     @yield('scripts')


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
