<?php
function checkBrackets($s = null) {
    return (bool)preg_match('/^(?<s>(?:\\[(?&s)\\]|\\((?&s)\\)|[^\\[\\]()]+)+)?$/x', $s);
}