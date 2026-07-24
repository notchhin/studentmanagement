<?php

namespace Tests\Unit;

use App\Http\Resources\Exam\ExamFormResource;
use Illuminate\Http\Request;
use Tests\TestCase;

class ExamResourceTest extends TestCase
{
    public function test_form_resource_includes_midterm_attendance_fields(): void
    {
        $resource = new ExamFormResource([
            'id' => 1,
            'student_id' => 'student-id',
            'last_name' => 'Doe',
            'first_name' => 'John',
            'gender' => 'M',
            'm_att' => 12.5,
        ]);

        $data = $resource->toArray(new Request());

        $this->assertSame(12.5, $data['m_att']);
        $this->assertSame(12.5, $data['mAtt']);
    }
}
