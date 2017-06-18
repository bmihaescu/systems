<?php
$connection = 'host=dbmaster.example.com port=5432 dbname=joomladb user=postgres password=Admin123';
$dbconn = pg_connect($connection);

var_dump($dbconn);
