<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Questionnaire extends Model
{
    use HasFactory;


    protected $fillable = ['sujet'];

    /**Relation 1..N entre user et Questionnaire*/
    public function utilisateur()
    {
        $this->belongsTo(User::class);
    }

    /** Relation 1..N entre Questionnaire et Question */
    public function questions()
    {
        return $this->hasMany(Question::class);
    }

    /** Relation N..N entre Questionnaire et Theme */    
    public function themes()
    {
        return $this->belongsToMany(Theme::class);
    }

}
