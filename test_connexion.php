<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

// Connexion à la base
$conn = new mysqli('localhost', 'root', '', 'e2clib_admin');

if ($conn->connect_error) {
    die("Erreur de connexion : " . $conn->connect_error);
}

// Récupérer toutes les colonnes de la table books
$result = $conn->query("SELECT * FROM books LIMIT 5");

if ($result) {
    echo "Connexion OK et table 'books' trouvée.<br>";
    echo "Nombre de livres trouvés : " . $result->num_rows . "<br><br>";

    while ($row = $result->fetch_assoc()) {
        echo "ID: " . $row['id'] . "<br>";
        echo "Titre: " . $row['title'] . "<br>";
        echo "Auteur: " . $row['auteur'] . "<br>";
        echo "Synopsis: " . $row['synopsis'] . "<br>";
        echo "Année: " . $row['year'] . "<br>";
        echo "Pages: " . $row['pages'] . "<br>";
        echo "Cover: " . $row['cover'] . "<br>";
        echo "Genre ID: " . $row['genre_id'] . "<br>";
        echo "Format ID: " . $row['format_id'] . "<br>";
        echo "Language ID: " . $row['languages_ID'] . "<br>";
        echo "User ID: " . $row['user_id'] . "<br>";
        echo "<hr>";
    }
} else {
    echo "Erreur SQL : " . $conn->error;
}

$conn->close();
?>