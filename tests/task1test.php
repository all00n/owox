<?php

use PHPUnit\Framework\TestCase;

require_once '/var/www/owox/task3.php';

final class task1test extends TestCase
{
private $classes = [
    0 => [
        'name' => 'Speaking',
        'duration' => 3,
        'rate' => 'full'
        ],
    1 => [
        'name' => 'Grammar',
        'duration' => 2,
        'rate' => 'one_hour'
        ]
    ];

private $rate = [
        'full' => ['price' => 200],
        'one_hour' => ['price' => 100]
    ];

private $history = [
        0 => 0,
        1 => 0,
        2 => 1,
        3 => 0,
    ];

    public function test_checkBrackets_to_true() {
        require_once '/var/www/owox/task1.php';
        $this->assertTrue( checkBrackets( '[5] * 3 - ( 4 - 7 * [3-6])') == true );
        $this->assertTrue( checkBrackets( '(2*2)+3+(2*4)') == true );
        $this->assertTrue( checkBrackets( '( 5 * 3 [ 6 ) - 6]') == false );
    }

    public function test_luckyTickets() {
        require_once '/var/www/owox/task2.php';
        $this->assertTrue( luckyTickets( 3) == false );
        $this->assertEquals(670, luckyTickets(4));
        $this->assertEquals(55252, luckyTickets(6));
    }

    public function test_Classes(){
        $classes = new Classes($this->classes,$this->rate);
        $this->assertTrue( $classes->addRate('Extra',300) == true );
        $this->assertArraySubset( ['name' => 'name already exists or not valid'], $classes->addRate('Extra',100));
        $this->assertArraySubset(
            [
                'name' => 'invalid name',
                'duration' => 'invalid duration',
                'rate' => 'invalid rate',
            ],
            $classes->addClasses('','',''));
        $this->assertTrue( $classes->addClasses('unlimited','-','Extra') == true );

    }

    public function test_Clients(){
        $classes = new Classes($this->classes,$this->rate);
        $clients = new Clients($this->history);
        $this->assertEquals(700, $classes->getSum($clients->history));
        $classes->addRate('Extra',300);
        $classes->addClasses('unlimited','-','Extra');
        $this->assertInternalType('numeric', $clients->addClasses(2));
        $this->assertEquals(1000, $classes->getSum($clients->history));
    }
}