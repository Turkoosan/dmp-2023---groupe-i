<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reponse extends Model
{
    use HasFactory;

    protected $fillable = [
        'reponse',
        'est_correct'
    ];

    /**Relation 1..N avec Question */
    public function question()
    {
        return $this->belongsTo(Question::class);
    }
}
