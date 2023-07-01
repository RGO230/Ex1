<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    public const TARIF = 300;
    public const PAID_STATUS = ['wait_for_payment'=>'wait_for_payment','paid'=>'paid'];
    use HasFactory;
    protected $guarded = [];
    public function countSum()
    {
        $this->sum = $this->hours * self::TARIF;
        $this->save();
    }
}
