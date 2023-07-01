<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Testing\Fluent\AssertableJson;
use Laravel\Sanctum\Sanctum;
use Tests\TestCase;

class TransactionCreateTest extends TestCase
{
    public function test_correct_data(): void
    {
        $user = User::factory()->create();
        Sanctum::actingAs($user);
        $response = $this->withHeaders([
            'Content-Type' => 'application/json',
            'Accept' => 'application/json',
        ])->post('/api/transaction',['employee_id'=>1,'hours'=>8]);
        $response->assertStatus(200);
        $response->assertJson(
            fn (AssertableJson $json) =>
            $json->whereAllType([
                'hours'=>['required','integer'],
                'employee_id' => ['required','exists:employees,id','integer'],
                'sum'=>['integer'],
                'updated_at'=>['required','string'],
                'created_at'=>['required','string'],
                'id'=>['required','integer']

            ])
        );
    }
}
