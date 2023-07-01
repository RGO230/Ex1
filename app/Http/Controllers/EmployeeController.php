<?php

namespace App\Http\Controllers;

use App\Http\Requests\EmployeeRequest;
use App\Models\Employee;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;

class EmployeeController extends Controller
{
    public function create(EmployeeRequest $request)
    {
        $employee = new Employee;
        $employee->email = $request->email;
        $employee->password = Hash::make($request->password);
        $employee->save();
        return response($employee);
    }
    
}
