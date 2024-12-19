<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\StudentController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });


Route::get('/no_permission', function () {
    return view('errors.no_permission');
});

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get('/', function () {
    return view('dashboard');
});

Route::resource('/employees', EmployeeController::class);

Route::get('/employees/search', [EmployeeController::class, 'search'])->name('employees.search');

Route::get('/students', [StudentController::class, 'index'])->name('students.index');
Route::get('/students/data', [StudentController::class, 'getStudents'])->name('students.data');
Route::get('/students/{id}', [StudentController::class, 'edit'])->name('students.edit');

Route::post('/students/store', [StudentController::class, 'store'])->name('students.store');
Route::put('/students/update/{id}', [StudentController::class, 'update'])->name('students.update');
Route::delete('/students/delete/{id}', [StudentController::class, 'destroy'])->name('students.delete');

Route::get('/logout', [UserController::class, 'logout']);