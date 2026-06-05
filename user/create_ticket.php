<?php
include "mongo.php";

$created = false;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $body = $_POST["message"];

    $bulk = new MongoDB\Driver\BulkWrite;

    $bulk->insert([
        "username" => $username,
        "message" => $body,
        "created_at" => date("Y-m-d H:i:s"),
        "status" => true,
        "comments" => []
    ]);

    $manager->executeBulkWrite("$database.$collection", $bulk);

    $created = true;
}
?>

<h1>Create Support Ticket</h1>

<a href="index.php">Back to Homepage</a> |
<a href="tickets.php">Back to Ticket List</a>

<br><br>

<?php if ($created) { ?>

    <p><b>Ticket created successfully.</b></p>

    <a href="create_ticket.php">Create Another Ticket</a> |
    <a href="tickets.php">Return to Ticket List</a>

<?php } else { ?>

    <form method="POST">
        <label>Username:</label><br>
        <input type="text" name="username" required><br><br>

        <label>Ticket Message:</label><br>
        <textarea name="message" required></textarea><br><br>

        <button type="submit">Create Ticket</button>
    </form>

<?php } ?>