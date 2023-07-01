<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Testing\Fluent\AssertableJson;
use Laravel\Sanctum\Sanctum;
use Tests\TestCase;

class TransactionCheckSumTest extends TestCase
{

    public function test_correct_data(): void
    {
        $user = User::factory()->create();
        Sanctum::actingAs($user);
        $response = $this->get('/api/transaction/sum');
        $response->assertStatus(200);
        $response->assertJson(
            fn (AssertableJson $json) =>
            $json->has(0)
                 
            
        );
    }
   
}
