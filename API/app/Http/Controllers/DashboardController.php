<?php

namespace App\Http\Controllers;

use App\Models\AcademicClass;
use App\Models\AcademicYear;
use App\Models\BlackList;
use App\Models\Student;
use App\Models\Teacher;
use App\Models\User;
use Illuminate\Http\Request;
use Throwable;

class DashboardController extends Controller
{
    public function summary()
    {

        $result['status'] = 200;

        try {

            $acYear = AcademicYear::where('is_active', 1)->first();
            $startDate = $acYear?->start_date;
            $endDate = $acYear?->end_date;

            $result['academic_classes'] = AcademicClass::count();
            $result['classes_this_term'] = $acYear ? AcademicClass::where('academic_year_id', $acYear->id)->count() : 0;
            $result['teachers'] = Teacher::count();
            $result['students'] = Student::count();
            $result['blacklist'] = BlackList::count();
            $result['new_students'] = $startDate && $endDate ? Student::whereBetween('created_at', [$startDate, $endDate])->count() : 0;
            $result['new_students_m'] = $startDate && $endDate ? Student::whereBetween('created_at', [$startDate, $endDate])->where('gender', 1)->count() : 0;
            $result['new_students_f'] = $startDate && $endDate ? Student::whereBetween('created_at', [$startDate, $endDate])->where('gender', 2)->count() : 0;
            $result['users'] = User::count();

            $student_in_month = [];

            for($i=1; $i<13; $i++){
                $student_in_month[$i-1] = Student::whereRaw("MONTH(created_at)=$i")->count();
            }

            $result['st_in_year'] = $student_in_month;

        } catch(Throwable $e) {
            $result['status'] = 201;
            $result['message'] = $e->getMessage();
        }

        return response()->json($result);

    }
}
