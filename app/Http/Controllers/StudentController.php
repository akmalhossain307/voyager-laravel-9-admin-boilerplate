<?php

namespace App\Http\Controllers;

use App\Models\Student;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\DB;
class StudentController extends Controller
{
    // Display students page
    public function index()
    {
        //dd(DB::select("SELECT DATABASE();"));
        return view('students.index');
    }

    // Get data for DataTables
    // public function getStudents(Request $request)
    // {
    //     $students = Student::all(); // You may want to paginate or use more complex logic here
    //     return DataTables::of($students)
    //         ->addColumn('action', function ($student) {
    //             return '
    //                 <button class="btn btn-warning btn-sm edit" data-id="' . $student->id . '">Edit</button>
    //                 <button class="btn btn-danger btn-sm delete" data-id="' . $student->id . '">Delete</button>
    //             ';
    //         })
    //         ->rawColumns(['action'])
    //         ->make(true);
    // }

    public function getStudents(Request $request)
    {
        $query = Student::query();

        if ($request->has('name') && !empty($request->name)) {
            $query->where('name', 'like', '%' . $request->name . '%');
        }

        if ($request->has('class') && !empty($request->class)) {
            $query->where('class', 'like', '%' . $request->class . '%');
        }

        return datatables()->of($query)->make(true);
    }

    // Store a new student
    // public function store(Request $request)
    // {
    //     $validated = $request->validate([
    //         'name' => 'required|string|min:2|max:255',
    //         'class' => 'required|string|min:2|max:255',
    //     ]);

    //     $student = Student::create($validated);
    //     return response()->json(['success' => true, 'message' => 'Student created successfully.']);
    // }

    public function store(Request $request)
{
    // Custom validation messages
    $customMessages = [
        'name.required' => 'The student name is required.',
        'name.string' => 'The student name must be a valid string.',
        'name.min' => 'The student name must be at least 2 characters.',
        'name.max' => 'The student name cannot exceed 255 characters.',
        
        'class.required' => 'The class is required.',
        'class.string' => 'The class must be a valid string.',
        'class.min' => 'The class name must be at least 2 characters.',
        'class.max' => 'The class name cannot exceed 255 characters.',
    ];

    // Validate the request with custom messages
    $validated = $request->validate([
        'name' => 'required|string|min:2|max:255',
        'class' => 'required|string|min:2|max:255',
    ], $customMessages);

    // If validation passes, create the student
    $student = Student::create($validated);

    // Return success response
    return response()->json(['success' => true, 'message' => 'Student created successfully.']);
}

    public function edit($id)
    {
        // Find the student by ID or fail
        $student = Student::findOrFail($id);

        // Return the student data as JSON
        return response()->json($student);
    }

    // Update a student
    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'name' => 'required|string|min:2|max:255',
            'class' => 'required|string|min:2|max:255',
        ]);

        $student = Student::find($id);
        $student->update($validated);
        return response()->json(['success' => true, 'message' => 'Student updated successfully.']);
    }

    // Delete a student
    public function destroy($id)
    {
        $student = Student::find($id);
        $student->delete();
        return response()->json(['success' => true, 'message' => 'Student deleted successfully.']);
    }
}
