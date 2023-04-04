<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    use HasFactory;

    protected $fillable = ['problematique'];
    
    /** Relation 1..N entre Question et Reponse  */
    public function reponses()
    {
        return $this->hasMany(Reponse::class);
    }

    public function level()
    {
        return $this->belongsTo(Level::class);
    }

    public function questionnaires()
    {
        return $this->belongsTo(Questionnaire::class);
    }
}
