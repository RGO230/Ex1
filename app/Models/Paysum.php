<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Paysum extends Model
{
    use HasFactory;
    protected $guarded = [];
    public function transactions(){
        $this->belongsToMany(Transaction::class);
    }
}
