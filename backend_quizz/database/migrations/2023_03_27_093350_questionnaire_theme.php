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
        Schema::create('questionnaire_theme', function ($table) {
            $table->integer('questionnaire_id')
                    ->unsigned()
                    ->index();
            $table->foreign('questionnaire_id')
                    ->references('id')
                    ->on('questionnaires')
                    ->onDelete('cascade');
            
            $table->integer('theme_id')
                    ->unsigned()
                    ->index();
            $table->foreign('theme_id')
                    ->references('id')
                    ->on('themes')
                    ->onDelete('cascade');
            $table->timestamps();

            $table->primary(['questionnaire_id','theme_id']);
        });


    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('questionnaire_theme');
    }
};
