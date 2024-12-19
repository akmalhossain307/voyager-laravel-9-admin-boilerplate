<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error 500 - Internal Server Error</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container text-center">
        <h1 class="display-4 text-danger">500 Internal Server Error</h1>
        <p class="lead">Something went wrong. Our team has been notified!</p>
        <p>If the issue persists, please contact support.</p>
        <a href="{{ url('/') }}" class="btn btn-primary">Go Back to Home</a>
    </div>
</body>
</html>
