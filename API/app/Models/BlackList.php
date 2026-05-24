<?php

namespace App\Models;

use App\Traits\CreatedUpdatedBy;
use App\Traits\UUIDs;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BlackList extends Model
{
    use HasFactory, UUIDs, CreatedUpdatedBy, SoftDeletes;

    protected $table = 'blacklist';

    protected $fillable = [
        'student_id',
        'reason',
        'from_date',
        'to_date',
        'created_by',
        'updated_by',
    ];

    public function student()
    {
        return $this->belongsTo(Student::class, 'student_id');
    }
}
