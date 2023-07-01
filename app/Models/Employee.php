<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Termwind\Components\Raw;

class Employee extends Model
{
    use HasFactory;
    protected $hidden = ['password'];
    protected $guarded=['email'];
    public function transactions(){
       return $this->hasMany(Transaction::class);
    }
    
    
}
