<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use \App\Models\User;
use \App\Models\Theme;
use \App\Models\Question;
use \App\Models\Questionnaire;
use \App\Models\Reponse;


class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $user1 = User::create(['name'=>'a','email'=> 'a@a','password'=> "123456"]);
        $questionnaire1 = Questionnaire::create(['sujet'=>'Relief de la mer mediterannée']);
        $questionnaire2 = Questionnaire::create(['sujet'=>"Relief de l'atlantique"]);

        $theme = Theme::create(['thematique'=>'Geo']);

        $question1 = Question::create(['problematique'=>"Quelle pays est au bords de la mediterranée ?"]);   
        $question2 = Question::create(['problematique'=>"Quelle pays n'est pas au bords de la mediterranée ?"]);   
        
        
        $rep1 = Reponse::create(['reponse'=>' près de la france','est_correct'=>true]);
        $rep2 = Reponse::create(['reponse'=>" près de l'islande",'est_correct'=> false]);
        $rep3 = Reponse::create(['reponse'=>' près du bénin','est_correct'=> false]);
        $rep4 = Reponse::create(['reponse'=>' près de la suisse','est_correct'=> false]);
       
        $rep5 = Reponse::create(['reponse'=>' près de la france','est_correct'=>false]);
        $rep6 = Reponse::create(['reponse'=>" près de l'italie",'est_correct'=> false]);
        $rep7 = Reponse::create(['reponse'=>' près du bénin','est_correct'=> true]);
        $rep8 = Reponse::create(['reponse'=>' près de le maroc','est_correct'=> false]);

        $question1->reponses()->saveMany([$rep1,$rep2,$rep3,$rep4]);    

        $question2->reponses()->saveMany([$rep5,$rep6,$rep7,$rep8]); 

        $questionnaire1->questions()->saveMany([$question1,$question2]);

        $theme->questionnaires()->saveMany([$questionnaire1,$questionnaire2]);
        $user1->questionnaires()->saveMany([$questionnaire1,$questionnaire2]);
    }

}
