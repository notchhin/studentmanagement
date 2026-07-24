<?php

namespace App\Http\Controllers;

use App\Http\Requests\Exam\StoreExamRequest;
use Throwable;
use App\Models\Exam;
use App\Models\Study;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use App\Http\Resources\Exam\ExamFormResource;
use App\Http\Resources\Exam\ExamShowResource;

class ExamController extends Controller
{
    private function getExamValue(array $exam, string $snakeKey, string $camelKey): mixed
    {
        return $exam[$snakeKey] ?? $exam[$camelKey] ?? 0;
    }

    public function form(Request $request)
    {

        abort_if(Gate::denies('score_save'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

        $result['status'] = 200;

        try {

            $exams = Study::leftJoin('exams', 'studies.student_id', 'exams.student_id')
                ->join('students', 'studies.student_id', 'students.id')
                ->select('studies.student_id', 'students.last_name', 'students.first_name', 'students.gender', 'studies.academic_class_id', 'exams.*')
                ->where('exams.academic_class_id', $request->academic_class_id)
                ->where('studies.academic_class_id', $request->academic_class_id)
                ->whereNull('studies.deleted_at')
                ->orderBy('students.last_name')
                ->get();

            $student_has_exams = $exams->pluck('student_id');

            $students = Study::join('students', 'studies.student_id', 'students.id')
                ->select('studies.student_id', 'students.last_name', 'students.first_name', 'students.gender')
                ->where('studies.academic_class_id', $request->academic_class_id)
                ->whereNotIn('studies.student_id', $student_has_exams)
                ->whereNull('studies.deleted_at')
                ->orderBy('students.last_name')
                ->get();

            $data = array_merge($students->toArray(), $exams->toArray());

            // $result['form'] =$data;

            $result['form'] = ExamFormResource::collection($data);
        } catch (Throwable $e) {
            $result['status'] = 201;
            $result['message'] = $e->getMessage();
        }

        return response()->json($result);
    }

    public function save(StoreExamRequest $request)
    {
        abort_if(Gate::denies('score_save'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

        $result['status'] = 200;

        try {

            DB::beginTransaction();
            foreach ($request->exams as $exam) {
                $tFinal = (
                    ($exam['att'] ?? 0)
                    + ($exam['quiz'] ?? 0)
                    + ($exam['hw'] ?? 0)
                    + ($exam['pp'] ?? 0)
                    + ($exam['pc'] ?? 0)
                    + ($exam['sp'] ?? 0)
                    + ($exam['ls'] ?? 0)
                    + ($exam['rd'] ?? 0)
                    + ($exam['st'] ?? 0)
                    + ($exam['wt'] ?? 0)
                );

                $total = ((($exam['t_mid'] ?? 0) + $tFinal) / 2);
                $mAtt = $this->getExamValue($exam, 'm_att', 'mAtt');
                $mQuiz = $this->getExamValue($exam, 'm_quiz', 'mQuiz');
                $mHw = $this->getExamValue($exam, 'm_hw', 'mHw');
                $mPp = $this->getExamValue($exam, 'm_pp', 'mPp');
                $mPc = $this->getExamValue($exam, 'm_pc', 'mPc');

                Exam::updateOrCreate(
                    [
                        "id" => $exam['id'] ?? null
                    ],
                    [
                        'academic_class_id' => $request->academic_class_id,
                        'student_id' => $exam['student_id'] ?? 0,
                        'att' => $exam['att'] ?? 0,
                        'quiz' => $exam['quiz'] ?? 0,
                        'hw' => $exam['hw'] ?? 0,
                        'pp' => $exam['pp'] ?? 0,
                        'pc' => $exam['pc'] ?? 0,
                        't_mid' => $exam['t_mid'] ?? 0,
                        'm_t_mid' =>  (
                            $mAtt
                            + $mQuiz
                            + $mHw
                            + $mPp
                            + $mPc
                        ),
                        'm_att' => $mAtt,
                        'm_quiz' => $mQuiz,
                        'm_hw' => $mHw,
                        'm_pp' => $mPp,
                        'm_pc' => $mPc,

                        'sp' => $exam['sp'] ?? 0,
                        'ls' => $exam['ls'] ?? 0,
                        'rd' => $exam['rd'] ?? 0,
                        'st' => $exam['st'] ?? 0,
                        'wt' => $exam['wt'] ?? 0,

                        't_final' => $tFinal,
                        'total' => $total,
                    ]
                );
            }
            DB::commit();

            $exams = Study::leftJoin('exams', 'studies.student_id', 'exams.student_id')
                ->join('students', 'studies.student_id', 'students.id')
                ->select('studies.student_id', 'students.last_name', 'students.first_name', 'students.gender', 'studies.academic_class_id', 'exams.*')
                ->where('exams.academic_class_id', $request->academic_class_id)
                ->where('studies.academic_class_id', $request->academic_class_id)
                ->whereNull('studies.deleted_at')
                ->orderBy('students.last_name')
                ->get();

            $student_has_exams = $exams->pluck('student_id');

            $students = Study::join('students', 'studies.student_id', 'students.id')
                ->select('studies.student_id', 'students.last_name', 'students.first_name', 'students.gender')
                ->where('studies.academic_class_id', $request->academic_class_id)
                ->whereNotIn('studies.student_id', $student_has_exams)
                ->whereNull('studies.deleted_at')
                ->orderBy('students.last_name')
                ->get();

            $data = ScoreRanking(array_merge($students->toArray(), $exams->toArray()));

            foreach ($data as $exam) {
                $ex = Exam::find($exam['id']);
                $ex->rank = $exam['rank'];
                $ex->save();
            }

            // $result['dara'] = $data;

        } catch (Throwable $e) {
            $result['status'] = 201;
            $result['message'] = $e->getMessage();
        }

        return response()->json($result);
    }

    public function show(Request $request)
    {

        abort_if(Gate::denies('score_list'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

        $exams = Study::leftJoin('exams', 'studies.student_id', 'exams.student_id')
            ->join('students', 'studies.student_id', 'students.id')
            ->select('studies.student_id', 'students.last_name', 'students.first_name', 'students.gender', 'studies.academic_class_id', 'exams.*')
            ->where('exams.academic_class_id', $request->academic_class_id)
            ->where('studies.academic_class_id', $request->academic_class_id)
            ->whereNull('studies.deleted_at')
            ->orderBy('students.last_name')
            ->get();

        $student_has_exams = $exams->pluck('student_id');

        $students = Study::join('students', 'studies.student_id', 'students.id')
            ->select('studies.student_id', 'students.last_name', 'students.first_name', 'students.gender')
            ->where('studies.academic_class_id', $request->academic_class_id)
            ->whereNotIn('studies.student_id', $student_has_exams)
            ->whereNull('studies.deleted_at')
            ->orderBy('students.last_name')
            ->get();

        $data = array_merge($students->toArray(), $exams->toArray());

        return ExamShowResource::collection($data);
    }
}
