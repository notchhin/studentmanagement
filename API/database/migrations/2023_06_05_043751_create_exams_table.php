<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('exams', function (Blueprint $table) {
            $table->id();
            $table->foreignUuid('academic_class_id')->index();
            $table->foreignUuid('student_id')->index();;
            $table->float('att')->default(0);
            $table->float('quiz')->default(0);
            $table->float('hw')->default(0);
            $table->float('pp')->default(0);
            $table->float('pc')->default(0);
            $table->float('t_mid')->default(0);
            $table->float('t_final')->default(0);
            $table->float('sp')->default(0);
            $table->float('ls')->default(0);
            $table->float('rd')->default(0);
            $table->float('st')->default(0);
            $table->float('wt')->default(0);

            $table->float('total', 5, 2)->default(0);
            $table->uuid('created_by')->nullable();
            $table->uuid('updated_by')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exams');
    }
};
