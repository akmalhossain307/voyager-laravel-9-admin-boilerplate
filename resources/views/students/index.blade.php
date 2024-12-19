
@extends('layouts.app')

@section('content')

 <!-- Content Header (Page header) -->
 <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Students</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="{{url('/')}}">Home</a></li>
                <li class="breadcrumb-item active">Students</li>
                </ol>
            </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
        </div>

<!-- Main content -->
<div class="content">
      <div class="container-fluid">
        
      <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header" style="background: #a4b9e1e6;color: black;font-weight: bold;">
                <h3 class="card-title">Student List</h3>
              </div>



              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">

             
        
              <!-- Add Filter Form -->
              <div class="mb-3">
                  <!-- Add Student Button -->
                        @if(auth()->user()->hasPermission('add_students'))
                            <button class="btn btn-success float-left" id="addStudentBtn"><i class="fas fa-plus"></i> Add Student</button>  
                        @endif
                        <input type="text" id="nameFilter" class="form-control mb-2" placeholder="Filter by Name">
                        <input type="text" id="classFilter" class="form-control mb-2" placeholder="Filter by Class">
                    </div>
                  
          

    


            <!-- Table to display employees -->
            
            <table id="studentsTable" class="table table-bordered table-striped table-sm">
                <thead style="background:#E9F1FF">
                    <tr>
                        <th>Name</th>
                        <th>Class</th>
                        <th>Action</th>
                    </tr>
                </thead>
            </table>

        </div><!-- /.card-body -->
      
            </div>
            <!-- /.card -->
          </div>
        </div>
        <!-- /.row -->

      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->


<!-- Modal for Add/Edit -->
<div class="modal fade" id="studentModal" tabindex="-1" aria-labelledby="studentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background: #E9F1FF;padding:10px">
                <h5 class="modal-title" id="studentModalLabel" style="font-size: 14px;font-weight: bold;color: #0E2D5F;">Add Student</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="opacity: 0.6;color: #3e031cf2;">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="border-left: 6px solid #E9F1FF;border-right: 6px solid #E9F1FF;
            border-bottom: 6px solid #E9F1FF;border-top: none;">
                <form id="studentForm">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="class">Class</label>
                        <input type="text" class="form-control" id="class" name="class" required>
                    </div>
  
                    <input type="hidden" id="studentId">
                    <div style="position: relative;top: 15px;padding: 5px;text-align: right;
                    background-color: #F4F4F4;width: 486px;margin-left: -16px;border: 1px solid #ddd;">

                    <button type="submit" class="btn btn-info btn-sm" ><i class="fas fa-save"></i>  Save</button>
                    <button type="submit" class="btn btn-danger btn-sm" data-dismiss="modal" style="margin-left:5px"><i class="fas fa-times-circle"></i>  Cancel</button>
</div>

                </form>
            </div>
        </div>
    </div>
</div>


@endsection

@section('scripts')
<script>

    $(document).ready(function () {
        // CSRF Token setup for AJAX requests
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        var table = $('#studentsTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: '{{ route('students.data') }}',
                data: function (d) {
                    // Add custom filters to the DataTable AJAX request
                    d.name = $('#nameFilter').val();
                    d.class = $('#classFilter').val();
                }
            },
            columns: [
                { data: 'name' },
                { data: 'class' },
                {
                    data: 'action', 
                    orderable: false, 
                    searchable: false,
                    render: function(data, type, row) {
                        // Adding icons to buttons
                        var buttons = '';
                        <?php 
                        if(auth()->user()->hasPermission('edit_students'))
                        {
                        ?>
                            buttons += '<button class="btn btn-warning edit" data-id="'+row.id+'" style="color: #ad1dd1;background-color: #ffc10747;border-color: #d907ff9e;box-shadow: none;"><i class="fas fa-edit"></i></button>';
                        <?php  
                        }
                        if(auth()->user()->hasPermission('delete_students'))
                        {
                        ?>
                            buttons += ' <button class="btn btn-danger delete" data-id="'+row.id+'" style="background-color:red;border-color: #e72134ed;color:white"><i class="fas fa-trash-alt"></i></button>';
                        <?php 
                        }
                        ?>
                        return buttons;
                      
                    //     return '<button class="btn btn-warning edit" data-id="'+row.id+'"><i class="fas fa-edit"></i> Edit</button>' +
                    //            ' <button class="btn btn-danger delete" data-id="'+row.id+'"><i class="fas fa-trash"></i> Delete</button>';
                    // 
                    }
                }
            ],
            dom: 'Bfrtip', // Adding buttons to the DataTable
            buttons: [
                {
                    extend: 'excelHtml5',
                    className: 'btn btn-success',
                    text: '<i class="fas fa-file-excel"></i> Export to Excel',
                    title: 'Students List'
                },
                {
                    extend: 'pdfHtml5',
                    className: 'btn btn-danger',
                    text: '<i class="fas fa-file-pdf"></i> Export to PDF',
                    title: 'Students List'
                },
                {
                    extend: 'print',
                    className: 'btn btn-primary',
                    text: '<i class="fas fa-print"></i> Print',
                    title: 'Students List'
                }
            ],
        pageLength: 5,  // Default number of records per page
        lengthMenu: [ [10, 25, 50, 100], [10, 25, 50, 100] ], // Show 10, 25, 50, 100 options in the dropdown
        });

        // Add Student
        $('#addStudentBtn').click(function () {
            $('#studentModalLabel').text('Add Student');
            $('#studentForm')[0].reset();
            $('#studentId').val('');
            $('#studentModal').modal('show');
        });

        // Edit Student
        $(document).on('click', '.edit', function () {
            var id = $(this).data('id');
            $.get('/students/' + id, function (data) {
                $('#studentModalLabel').text('Edit Student');
                $('#name').val(data.name);
                $('#class').val(data.class);
                $('#studentId').val(data.id);
                $('#studentModal').modal('show');
            }).fail(function (error) {
                toastr.error('Error fetching student data');
            });
        });

        // Save Student (Add or Edit)
        $('#studentForm').submit(function (e) {
            e.preventDefault();
            var id = $('#studentId').val();
            var url = id ? '/students/update/' + id : '/students/store';
            var method = id ? 'PUT' : 'POST';

            $.ajax({
                url: url,
                method: method,
                data: $(this).serialize(),
                success: function (response) {
                    $('#studentModal').modal('hide');
                    table.ajax.reload();
                    toastr.success(response.message);
                },
                error: function (xhr) {
            // Clear any previous error messages
            $('.invalid-feedback').remove();

            // Loop through each field's error and display it
            if (xhr.status === 422) {
                var errors = xhr.responseJSON.errors;
                $.each(errors, function (field, messages) {
                    var input = $('#studentForm').find('[name="' + field + '"]');
                    var errorMessage = '<div class="invalid-feedback">' + messages.join('<br>') + '</div>';
                    input.addClass('is-invalid');  // Add the class for invalid input
                    input.after(errorMessage);     // Append the error message after the input field
                });
            } else {
                toastr.error('Something went wrong');
            }
        }
            });
        });

        // Delete Student
        $(document).on('click', '.delete', function () {
            var id = $(this).data('id');

            // SweetAlert confirmation
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this action!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Perform delete via AJAX
                    $.ajax({
                        url: '/students/delete/' + id,
                        method: 'DELETE',
                        success: function (response) {
                            table.ajax.reload();
                            toastr.success(response.message);

                            // Show SweetAlert success message
                            Swal.fire(
                                'Deleted!',
                                'Your student has been deleted.',
                                'success'
                            );
                        },
                        error: function () {
                            Swal.fire(
                                'Error!',
                                'Something went wrong, please try again.',
                                'error'
                            );
                        }
                    });
                }
            });
        });

        // Apply filters when the user types in the filter inputs
        $('#nameFilter, #classFilter').keyup(function () {
            table.ajax.reload(); // Reload the DataTable when filters change
        });
    });

// Make the modal draggable and resizable
$('#studentModal .modal-dialog').draggable({
        handle: ".modal-header", // Allow dragging only from the modal header
        cursor: "move"
    }).resizable({
        minHeight: 300,
        minWidth: 400
    });

</script>
@endsection

