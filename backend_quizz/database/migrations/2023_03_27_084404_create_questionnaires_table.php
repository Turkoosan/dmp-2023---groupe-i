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
        Schema::create('questionnaires', function (Blueprint $table) {
            $table->id();
            $table->string('sujet');
            $table->integer('user_id')->nullable();
            $table->foreign('user_id')
                ->references('id')
                ->on('users');
            $table->integer('themes_id')->nullable();
            $table->foreign('themes_id')
                ->references('id')
                ->on('themes');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('questionnaires');
    }
};
