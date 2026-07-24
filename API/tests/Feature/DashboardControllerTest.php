<?php

namespace Tests\Feature;

use App\Http\Controllers\DashboardController;
use App\Models\AcademicYear;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class DashboardControllerTest extends TestCase
{
    use RefreshDatabase;

    public function test_summary_returns_zeroes_when_no_active_academic_year_exists(): void
    {
        AcademicYear::query()->update(['is_active' => 0]);

        $response = app(DashboardController::class)->summary();
        $payload = json_decode($response->getContent(), true);

        $this->assertSame(200, $payload['status']);
        $this->assertSame(0, $payload['classes_this_term']);
        $this->assertSame(0, $payload['new_students']);
    }
}
