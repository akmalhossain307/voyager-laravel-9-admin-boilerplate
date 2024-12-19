@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Add New Employee</h2>

    <form method="POST" action="{{ route('employees.store') }}">
        @csrf
        <div class="form-group">
            <label for="emp_name">Name:</label>
            <input type="text" class="form-control" name="emp_name" id="emp_name" required>
        </div>

        <div class="form-group">
            <label for="emp_name">Designation:</label>
            <input type="text" class="form-control" name="emp_designation" id="emp_designation" required>
        </div>
        <div class="form-group">
            <label for="emp_name">Email:</label>
            <input type="email" class="form-control" name="emp_email" id="emp_email">
        </div>
        <div class="form-group">
            <label for="emp_name">Mobile:</label>
            <input type="text" class="form-control" name="emp_mobile" id="emp_mobile">
        </div>
        <div class="form-group">
            <label for="emp_name">Address:</label>
            <input type="text" class="form-control" name="emp_address" id="emp_address">
        </div>
<div>
    
</div>

        <a href="/employees" class="btn btn-primary">Back to Home</a>
        <button type="submit" class="btn btn-success" style="text-align:center;">Add Employee</button>

    </form>
</div>
@endsection
