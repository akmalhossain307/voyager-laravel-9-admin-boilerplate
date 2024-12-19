@extends('layouts.app')

@section('content')
<div class="container text-center">
        <h1 class="display-4 text-danger">403 Forbidden</h1>
        <p class="lead">You do not have permission to access this resource.</p>
        <a href="{{ url('/') }}" class="btn btn-info">Go Back to Home</a>
    </div>
@endsection
