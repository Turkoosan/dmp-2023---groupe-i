<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Questionnaires extends Model
{
    use HasFactory;


    protected $fillable = ['theme_id'];

    public function questions()
    {
        return $this->belongsToMany(Question::class);
    }

    public function theme()
    {
        return $this->belongsTo(Theme::class);
    }

}
