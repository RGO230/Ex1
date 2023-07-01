<?php

namespace Tests\Feature;

use App\Http\Controllers\EmployeeController;
use App\Http\Requests\EmployeeRequest;
use App\Models\User;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Process\FakeInvokedProcess;
use Illuminate\Support\Str;
use Illuminate\Testing\Fluent\AssertableJson;
use Laravel\Sanctum\Sanctum;
use Tests\TestCase;
use JMac\Testing\Traits\AdditionalAssertions;


class EmployeeCreateTest extends TestCase
{
    use WithFaker;
    use AdditionalAssertions;



    /**
     * A basic feature test example.
     */
    public function create_employee_form_request(): void
    {
        $this->assertActionUsesFormRequest(
            EmployeeController::class,
            'create',
            EmployeeRequest::class
        );
    }
    public function test_incorrect_data(): void
    {
        $user = User::factory()->create();
        Sanctum::actingAs($user);
        $response = $this->post('/api/employee', ['email' => 12, 'password' => '']);
        $response->assertStatus(302);
    }
    public function test_response_and_status(): void
    {
        $user = User::factory()->create();
        Sanctum::actingAs($user);
        $response = $this->withoutExceptionHandling()->withHeaders([
            'Content-Type' => 'application/json',
            'Accept' => 'application/json',
        ])->post('/api/employee', array('email' => $this->faker->email, 'password' => $this->faker->password(10)));
        $response->assertCreated();
        $response->assertJson(
            fn (AssertableJson $json) =>
            $json->whereAllType([
                'email' => 'string|required|email:rfc,dns',
                'updated_at' => 'string|reqiured',
                'created_at' => 'string|required',
                'id' => 'integer|required'
            ])
        );
    }
}
