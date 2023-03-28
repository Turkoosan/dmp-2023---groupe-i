<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    use HasFactory;

    protected $fillable = ['problematique', 'level_id'];

    public function level()
    {
        return $this->belongsTo(Level::class);
    }

    public function questionnaires()
    {
        return $this->belongsToMany(Questionnaires::class);
    }
}
