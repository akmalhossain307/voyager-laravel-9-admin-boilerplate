@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Edit Employee</h2>

    <form method="POST" action="{{ route('employees.update', $employee->id) }}">
        @csrf
        @method('PUT')
        <div class="form-group">
            <label for="emp_name">Name:</label>
            <input type="text" class="form-control" name="emp_name" id="emp_name" value="{{ $employee->emp_name }}" required>
        </div>

        <div class="form-group">
            <label for="emp_name">Degsignation:</label>
            <input type="text" class="form-control" name="emp_designation" id="emp_designation" value="{{ $employee->emp_designation }}" required>
        </div>

        <div class="form-group">
            <label for="emp_name">Email:</label>
            <input type="email" class="form-control" name="emp_email" id="emp_email" value="{{ $employee->emp_email }}" required>
        </div>

        <div class="form-group">
            <label for="emp_name">Mobile:</label>
            <input type="text" class="form-control" name="emp_mobile" id="emp_mobile" value="{{ $employee->emp_mobile }}" required>
        </div>

        <div class="form-group">
            <label for="emp_address">Address:</label>
            <input type="text" class="form-control" name="emp_address" id="emp_address" value="{{ $employee->emp_address }}" required>
        </div>

        <button type="submit" class="btn btn-warning">Update Employee</button>
    </form>
</div>
@endsection
