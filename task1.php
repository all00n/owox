<?php
function checkBrackets($s) {
    return (bool)preg_match('/^(?<s>(?:\[(?&s)\]|\((?&s)\)|\{(?&s)\}|[^\[\](){}]+)+)?$/x', $s);
}
