<?php
class Classes {

    private $classes = [];
    private $rate = [];

    public function __construct($classes,$rate)
    {
        $this->classes = $classes;
        $this->rate = $rate;
    }

    public function addClasses($name,$duration,$rate){
        if($error = $this->validate(['name' => $name,'duration' => $duration,'rate' => $rate]))
            return $error;

        $this->classes[] = [
                'name' => $name,
                'duration' => $duration,
                'rate' => $rate
            ];

        return true;
    }

    public function addRate($name,$price){
        if($error = $this->validateRate(['name'=>$name,'price'=>$price]))
            return $error;

        $this->rate[$name] = ['price'=>$price];

        return true;
    }

    public function getSum($history){
        $sum = 0;

        foreach ($history as $class){
            $sum += $this->rate[$this->classes[$class]['rate']]['price'];
        }

        return $sum;
    }

    private function validate($date){
        $error = [];
        if(!isset($date['name']) || $date['name'] == '')
            $error['name'] = 'invalid name';

        if(!isset($date['duration']) || $date['duration'] == '')
            $error['duration'] = 'invalid duration';

        if(!isset($date['rate']) || $date['rate'] == '' || !isset($this->rate[$date['rate']]))
            $error['rate'] = 'invalid rate';

        return $error;
    }

    private function validateRate($date){
        $error = [];
        if(!isset($date['name']) || $date['name'] == '' || isset($this->rate[$date['name']]))
            $error['name'] = 'name already exists or not valid';

        if(!isset($date['price']) || $date['price'] == '')
            $error['price'] = 'invalid price';

        return $error;
    }
}

class Clients {
    public $history;

    public function __construct($history)
    {
        $this->history = $history;
    }

    public function addClasses($class){
        return $this->history[] = $class;
    }
}