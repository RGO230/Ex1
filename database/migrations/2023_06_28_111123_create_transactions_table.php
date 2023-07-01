<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->enum('paid_status',['wait_for_payment','paid'])->default('wait_for_payment');
            $table->integer('hours');
            $table->unsignedBigInteger('employee_id');
            $table->integer('sum')->default(0);
            $table->foreign('employee_id')->references('id')->on('employees')->onDelete('cascade');

        
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transactions');
    }
};
