<?php
if (!isset($headerClass)) {
    $headerClass = "dashboard"; // default style
}

if (!isset($headerText)) {
    $headerText = $_SESSION["member"]->name;
}

?>

<!DOCTYPE html>

<html>

<head>
    <title>TeamBuilder</title>
    <!-- Milligram v1.4.1  -->
    <link rel="stylesheet" href="/node_modules/milligram/dist/milligram.min.css">
    <!-- normalize.css v8.0.1 -->
    <link rel="stylesheet" href="/node_modules/normalize.css/normalize.css">
    <!-- Font Awesome Free 5.15.4 -->
    <link rel="stylesheet" href="/node_modules/@fortawesome/fontawesome-free/css/all.min.css">

    <!-- Font Awesome Free 5.15.4 js -->
    <script src="/node_modules/@fortawesome/fontawesome-free/js/all.min.js"></script>

    <!-- Looper css -->
    <link rel="stylesheet" href="/public/resources/css/teamBuilder.css">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
</head>

<body>
    <header class="dashboard">
        <section class="container">
            <h1>TeamBuilder</h1>
            <p>Vous êtes connecté en tant que : <?= $headerText ?></p>

        </section>
    </header>
    </br>
    </br>
    <div class="container dashboard">
        <?= $content ?>
    </div>

</body>

</html>