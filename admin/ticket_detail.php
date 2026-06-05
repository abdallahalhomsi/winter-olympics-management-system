<?php
include "mongo.php";

date_default_timezone_set("Asia/Jerusalem");

$id = $_GET["id"];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $bulk = new MongoDB\Driver\BulkWrite;

    if (!empty($_POST["comment"])) {
        $bulk->update(
            ["_id" => new MongoDB\BSON\ObjectId($id)],
            [
                '$push' => [
                    "comments" => [
                        "username" => "admin",
                        "comment" => $_POST["comment"],
                        "created_at" => date("Y-m-d H:i:s")
                    ]
                ]
            ]
        );
    }

    if (isset($_POST["resolve"])) {
        $bulk->update(
            ["_id" => new MongoDB\BSON\ObjectId($id)],
            [
                '$set' => [
                    "status" => false
                ]
            ]
        );
    }

    $manager->executeBulkWrite("$database.$collection", $bulk);

    header("Location: ticket_detail.php?id=" . $id);
    exit;
}

$query = new MongoDB\Driver\Query([
    "_id" => new MongoDB\BSON\ObjectId($id)
]);

$result = $manager->executeQuery("$database.$collection", $query);
$ticket = current($result->toArray());
?>

<h1>Admin Ticket Details</h1>

<a href="index.php">Back to Dashboard</a>

<br><br>

<p><b>Username:</b> <?php echo $ticket->username; ?></p>
<p><b>Created At:</b> <?php echo $ticket->created_at; ?></p>
<p><b>Message:</b> <?php echo $ticket->message; ?></p>
<p><b>Status:</b> <?php echo $ticket->status ? "Active" : "Resolved"; ?></p>

<hr>

<h3>Comments</h3>

<?php
if (!isset($ticket->comments) || count($ticket->comments) == 0) {
    echo "<p>No comments yet.</p>";
} else {
    foreach ($ticket->comments as $comment) {
        echo "<div style='border:1px solid gray; padding:10px; margin-bottom:10px;'>";

        if (is_object($comment)) {
            echo "<b>Created At:</b> " . ($comment->created_at ?? "No time available") . "<br>";
            echo "<b>Username:</b> " . ($comment->username ?? "Unknown") . "<br>";
            echo "<b>Comment:</b> " . ($comment->comment ?? "");
        } else {
            echo "<b>Created At:</b> No time available<br>";
            echo "<b>Username:</b> Unknown<br>";
            echo "<b>Comment:</b> " . $comment;
        }

        echo "</div>";
    }
}
?>

<hr>

<form method="POST">
    <label>Admin Comment:</label><br>
    <textarea name="comment" required></textarea><br><br>
    <button type="submit">Add Comment</button>
</form>

<br>

<?php if ($ticket->status) { ?>
<form method="POST">
    <button name="resolve" value="1" type="submit">Mark as Resolved</button>
</form>
<?php } ?>