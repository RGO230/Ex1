<?php

namespace App\Http\Controllers;

use App\Http\Requests\TransactionRequest;
use App\Models\Employee;
use App\Models\Transaction;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    
    public function create(TransactionRequest $request)
    {
        $transaction = new Transaction;
        $transaction->employee_id = $request->employee_id;
        $transaction->hours = $request->hours;
        $transaction->save();
        $transaction->countSum();
        return response($transaction);
    }
    public function pay(){
        Transaction::query()->update(['paid_status'=>Transaction::PAID_STATUS['paid']]);
        return response (null,200);
    }
    public function checkSum()
    {

        return Employee::withSum('transactions', 'sum')->whereHas('transactions', function ($q) {
            $q->where('paid_status', Transaction::PAID_STATUS['wait_for_payment']);
        })->pluck('transactions_sum_sum', 'id');
    }
}
