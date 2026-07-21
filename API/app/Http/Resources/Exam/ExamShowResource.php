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

            'total' => $this['total'] ?? 0
        ];
    }
}
