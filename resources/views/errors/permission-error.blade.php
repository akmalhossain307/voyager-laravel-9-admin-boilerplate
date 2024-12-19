<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Permission Error</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container text-center">
        <h1 class="display-4 text-danger">Permission Error</h1>
        <p class="lead">You do not have the necessary permissions to access this resource. Please contact an administrator if you believe this is a mistake.</p>
        <a href="{{ url('/') }}" class="btn btn-primary">Back to Home</a>
    </div>
</body>
</html>
