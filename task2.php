<?php
function luckyTickets ($k){

    if ($k%2 != 0){
        return false;
    }

    $ticket = 0;
    $maxTicket = '';
    $octets = [];

    for($i=0; $i<$k; $i++){
        $maxTicket .= 9;
    }

    $octets[0] = substr($maxTicket,0,strlen($maxTicket)/2);
    $octets[1] = substr($maxTicket,strlen($maxTicket)/2,strlen($maxTicket)/2);

    for($oneOctet = $octets[0]; $oneOctet >= 0; $oneOctet--){
        for($twoOctet = $octets[1]; $twoOctet >= 0; $twoOctet--){
            if(array_sum(preg_split('//', $oneOctet, -1)) == array_sum(preg_split('//', $twoOctet, -1))){
                $ticket++;
            }
        }
    }
    return $ticket;
}