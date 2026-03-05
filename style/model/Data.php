<?php

class Data {
    private $bdd;
    
    public function __construct() {
        try {
     $this->bdd = new PDO("mysql:host=localhost;dbname=e2clib_oli;charset=utf8","phpmyadmin","PNE2Cgrandlille");
        } catch (Exception $e) {
            ("Problème de connexion : " . $e->getMessage());
        }
    }

    public function authentification($email){
        $sql = "SELECT id, email, password FROM users WHERE email= :email";
        $statement = $this->bdd->prepare($sql);
        $statement->execute(['email' => $email]);
        $req = $statement->fetch();

        return $req;
    }
}