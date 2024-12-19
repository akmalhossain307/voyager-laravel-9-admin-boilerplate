<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Employee;
use App\Models\User;
use TCG\Voyager\Models\Permission;
class EmployeeController extends Controller
{
    public function __construct()
    {
        // Middleware to check 'browse_employees' for any action
        $this->middleware(function ($request, $next) {
            // You can check permissions for the whole controller here if needed
            if (!auth()->user()->hasPermission('browse_employees')) {
                abort(403, 'Unauthorized access'); // Or redirect
            }
            return $next($request);
        });
    }

    // public function index()
    // {
    //      // Check if the user has permission to browse employees
    //      if (!auth()->user()->hasPermission('browse_employees')) {
    //         abort(403, "You don't have permission to access this resource!");
    //     }
    //     $employees = Employee::paginate(10);
    //     return view('employees.employee_list', compact('employees'));

    // }


    public function index(Request $request)
    {
        $query = Employee::query();
    
        // Apply filters if present
        if ($request->filled('name')) {
            $query->where('emp_name', 'like', '%' . $request->name . '%');
        }
        if ($request->filled('email')) {
            $query->where('emp_email', 'like', '%' . $request->email . '%');
        }
        if ($request->filled('mobile')) {
            $query->where('emp_mobile', 'like', '%' . $request->mobile . '%');
        }
    
        // Paginate the results
        $employees = $query->paginate(10);
    
        return view('employees.employee_list', compact('employees'));
    }
    

    
    public function create()
    {
        if (!auth()->user()->hasPermission('add_employees')) {
            abort(403, "You don't have permission to access this resource!");
        }
        return view('employees.create'); // Display the form to add a new employee
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'emp_name' => 'required|string|max:100',
            'emp_designation' => 'required|string|max:150',
            'emp_email' => 'max:100',
            'emp_mobile' => 'string|max:11',
            'emp_address' => 'string|max:255',
        ]);

        Employee::create($validated); // Store the new employee data

        // Redirect to employee index page with success message
        return redirect()->route('employees.index')->with('success', 'Employee added successfully');
    }

    public function edit(Employee $employee)
    {
        return view('employees.edit', compact('employee')); // Show the edit form for an employee
    }

    public function update(Request $request, Employee $employee)
    {
        $validated = $request->validate([
           'emp_name' => 'required|string|max:100',
            'emp_designation' => 'required|string|max:150',
            'emp_email' => 'max:100',
            'emp_mobile' => 'string|max:11',
            'emp_address' => 'string|max:255',
        ]);

        $employee->update($validated); // Update the employee data

        // Redirect to employee index page with success message
        return redirect()->route('employees.index')->with('success', 'Employee updated successfully');
    }

    public function destroy(Employee $employee)
    {
        $employee->delete(); // Delete the employee record

        // Redirect to employee index page with success message
        return redirect()->route('employees.index')->with('success', 'Employee deleted successfully');
    }
}
