<?php

namespace App\Models;

use App\Traits\CreatedUpdatedBy;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Exam extends Model
{
    use HasFactory, CreatedUpdatedBy, SoftDeletes;

    protected $fillable = [
        'academic_class_id',
        'student_id',
        'att',
        'quiz',
        'hw',
        'pp',
        'pc',
        't_mid',
        't_final',
        'sp',
        'ls',
        'rd',
        'st',
        'wt',
        'total',
        'rank',
        'm_att',
        'm_quiz',
        'm_hw',
        'm_pp',
        'm_pc',
        'm_t_mid',

    ];
}
