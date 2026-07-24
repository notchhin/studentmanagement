<?php

namespace App\Http\Resources\Exam;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ExamShowResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this['id'] ?? null,
            'student_id' => $this['student_id'],
            'last_name' => $this['last_name'],
            'first_name' => $this['first_name'],
            'gender' => $this['gender'],
            'att' => $this['att'] ?? 0,
            'quiz' => $this['quiz'] ?? 0,
            'hw' => $this['hw'] ?? 0,
            'pp' => $this['pp'] ?? 0,
            'pc' => $this['pc'] ?? 0,
            't_mid' => $this['t_mid'] ?? 0,
            't_final' => $this['t_final'] ?? 0,
            'sp' => $this['sp'] ?? 0,
            'ls' => $this['ls'] ?? 0,
            'rd' => $this['rd'] ?? 0,
            'st' => $this['st'] ?? 0,
            'wt' => $this['wt'] ?? 0,
            'm_att' => $this['m_att'] ?? $this['mAtt'] ?? 0,
            'mAtt' => $this['mAtt'] ?? $this['m_att'] ?? 0,
            'm_quiz' => $this['m_quiz'] ?? $this['mQuiz'] ?? 0,
            'mQuiz' => $this['mQuiz'] ?? $this['m_quiz'] ?? 0,
            'm_hw' => $this['m_hw'] ?? $this['mHw'] ?? 0,
            'mHw' => $this['mHw'] ?? $this['m_hw'] ?? 0,
            'm_pp' => $this['m_pp'] ?? $this['mPp'] ?? 0,
            'mPp' => $this['mPp'] ?? $this['m_pp'] ?? 0,
            'm_pc' => $this['m_pc'] ?? $this['mPc'] ?? 0,
            'mPc' => $this['mPc'] ?? $this['m_pc'] ?? 0,
            'm_t_mid' => $this['m_t_mid'] ?? 0,
            'total' => $this['total'] ?? 0
        ];
    }
}
