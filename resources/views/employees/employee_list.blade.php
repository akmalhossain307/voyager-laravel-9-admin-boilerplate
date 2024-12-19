
<style>
    .compact-table thead,
    .compact-table th,
    .compact-table td {
    line-height: 10px; /* Set the line height */
    padding: 0px 0px;  /* Reduce padding */
}

</style>

@extends('layouts.app')

@section('content')
<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h2 class="m-0">Employee Information</h2>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="{{ url('/') }}">Home</a></li>
                    <li class="breadcrumb-item active">Employees</li>
                </ol>
            </div>
        </div>
    </div>
</div>

<!-- Main content -->
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">

                        <h3 class="card-title">
                        @if(auth()->user()->hasPermission('add_employees'))
                        <a style="margin-left:-15px;" href="{{ route('employees.create') }}" class="btn btn-primary btn-sm"><i class="fas fa-plus"></i> Add Employee</a>
                        @endif
                        </h3>

                        <!-- <div class="card-tools">
                            <div class="input-group input-group-sm" style="width: 200px;">
                                <input type="text" name="table_search" class="form-control float-right" placeholder="Search">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-default">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </div> -->
    <div class="card-tools" style="margin-bottom:-15px;">
    <form method="GET" action="{{ route('employees.index') }}">
        <div class="row">
            <div class="col-md-3" >
                <input type="text" name="name" class="form-control" placeholder="Name" style="height:30px;"  value="{{ request('name') }}">
            </div>

            <div class="col-md-3">
                <input type="text" name="email" class="form-control" placeholder="Email" style="height:30px;" value="{{ request('email') }}">
            </div>

            <div class="col-md-3">
                <input type="text" name="mobile" class="form-control" placeholder="Mobile" style="height:30px;" value="{{ request('mobile') }}">
            </div>

            <div class="col-md-3">
                <button type="submit" class="btn btn-success btn-sm" ><i class="fas fa-search"></i> Search</button>
                <a href="{{ route('employees.index') }}" class="btn btn-danger btn-sm">Reset</a>
            </div>

        </div>
    </form>
</div>


                        
                    </div>


                    <div class="card-body table-responsive p-0 compact-table">
                        <table class="table table-bordered table-striped compact-table">
                            <thead style="background-color:#28a745; color:#fff; text-align:center;">
                                <tr>
                                    <th>SL</th>
                                    <th>Name</th>
                                    <th>Designation</th>
                                    <th>Email</th>
                                    <th>Mobile</th>
                                    <th>Address</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody id="employee-table-body">
                                @foreach ($employees as $index => $employee)
                                <tr>
                                    <td>{{ $employees->firstItem() + $index }}</td>
                                    <td>{{ $employee->emp_name }}</td>
                                    <td>{{ $employee->emp_designation }}</td>
                                    <td>{{ $employee->emp_email }}</td>
                                    <td>{{ $employee->emp_mobile }}</td>
                                    <td>{{ $employee->emp_address }}</td>
                                    <td style="line-height: 10px; padding:2px;">
                                        @if(auth()->user()->hasPermission('read_employees'))
                                            <a href="#" class="btn btn-primary btn-sm" title='View' style="color: #0d6efd;background-color: rgba(13, 110, 253, 0.1);border-color: rgba(13, 110, 253, 0.3);"><i class="fas fa-eye"></i></a>
                                        @endif
                                        @if(auth()->user()->hasPermission('edit_employees'))
                                            <a href="{{ route('employees.edit', $employee->id) }}" class="btn btn-warning btn-sm" style="background:rgba(40, 167, 69, 0.1); color:#28a745" title='Edit'><i class="fas fa-edit"></i></a>
                                        @endif
                                        @if(auth()->user()->hasPermission('delete_employees'))
                                        <form action="{{ route('employees.destroy', $employee->id) }}" method="POST" style="display:inline;">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-danger btn-sm" title='Delete' style="    color: #dc3545;background-color: rgba(220, 53, 69, 0.1);border-color: rgba(220, 53, 69, 0.3);"><i class="fas fa-trash-alt"></i></button>
                                        </form>
                                        @endif
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <!-- <div class="pagination-links">
                            {{ $employees->links('pagination::bootstrap-5') }}
                        </div> -->
                        <div class="pagination-links">
                            {{ $employees->appends(request()->query())->links('pagination::bootstrap-5') }}
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

