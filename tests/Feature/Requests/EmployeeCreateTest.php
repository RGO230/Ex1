<?php

    namespace Tests\Feature\Requests;
    
    use App\Http\Requests\EmployeeRequest;
    use App\Models\User;
    use Illuminate\Foundation\Testing\RefreshDatabase;
    use Illuminate\Foundation\Testing\WithFaker;
    use Illuminate\Testing\Fluent\AssertableJson;
    use Illuminate\Validation\Rules\Password;
    use Tests\TestCase;
    use JMac\Testing\Traits\AdditionalAssertions;
    use Laravel\Sanctum\Sanctum;
    
    class EmployeeCreateTest extends TestCase
    {
        use AdditionalAssertions;
        use WithFaker;
    
        public function test_it_verifies_validation_rules(): void
        {   
            $user = User::factory()->create();
            Sanctum::actingAs($user);
            $formRequest = new EmployeeRequest();
            $this->assertExactValidationRules([
                'email' => ['string', 'required', 'email:rfc,dns'],
                'password' => [
                    'required',
                    'string',
                    Password::min(8)
                        ->letters()
                        ->uncompromised()
                        ->numbers()
                        ->mixedCase()
                        ->symbols()
                ],
            ], $formRequest->rules());
            
            
    
            
        }
        public function it_verifies_authorized()
        {
    
            $formRequest = new EmployeeRequest();
            $this->assertTrue($formRequest->authorize());
        }
    }
    

