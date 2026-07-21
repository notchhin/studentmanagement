<?php

namespace App\Http\Controllers;

use App\Http\Requests\Student\StoreStudentRequest;
use App\Http\Requests\Student\UpdateStudentRequest;
use Throwable;
use App\Models\Student;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class StudentHistory extends Controller
{
    public function list(Request $request)
    {

        abort_if(Gate::denies('student_list'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

        $result['status'] = 200;

        try {

            $registerAtFrom = $request->input('register_at_from');
            $registerAtTo = $request->input('register_at_to');
            $village = $request->input('village');
            $today = Carbon::today()->toDateString();

            $query = Student::withTrashed()->filter(['search' => $request->search])
                ->when($village, function ($query) use ($village) {
                    $query->where('village', $village);
                })
                ->when($registerAtFrom, function ($query) use ($registerAtFrom) {
                    $query->whereDate('register_at', '>=', Carbon::parse($registerAtFrom)->toDateString());
                })
                ->when($registerAtTo, function ($query) use ($registerAtTo) {
                    $query->whereDate('register_at', '<=', Carbon::parse($registerAtTo)->toDateString());
                })
                ->with(['activeBlacklist' => function ($query) use ($today) {
                    $query
                        ->where(function ($query) use ($today) {
                            $query->whereNull('from_date')
                                ->orWhereDate('from_date', '<=', $today);
                        })
                        ->where(function ($query) use ($today) {
                            $query->whereNull('to_date')
                                ->orWhereDate('to_date', '>=', $today);
                        })
                        ->latest();
                }])
                ->orderByRaw('CAST(code AS UNSIGNED) ASC')
                ->latest()
                ->paginate($request->perPage);

            $query->getCollection()->transform(function ($student) {
                if ($student->activeBlacklist->isNotEmpty()) {
                    $student->status = 2;
                }

                return $student;
            });

            $result['data'] = $query;

            // distinct list of villages for the filter dropdown
            $result['villages'] = Student::whereNotNull('village')
                ->where('village', '!=', '')
                ->distinct()
                ->orderBy('village')
                ->pluck('village')
                ->map(fn($v) => ['id' => $v, 'name' => $v]);
        } catch (Throwable $e) {
            $result['status'] = 201;
            $result['message'] = $e->getMessage();
        }

        return response()->json($result);
    }
}
