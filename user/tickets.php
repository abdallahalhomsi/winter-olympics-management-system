<?php
include "mongo.php";

/* Get usernames with active tickets only */
$usernameQuery = new MongoDB\Driver\Query(["status" => true]);
$usernameResult = $manager->executeQuery("$database.$collection", $usernameQuery);

$usernames = [];

foreach ($usernameResult as $ticket) {
    if (!in_array($ticket->username, $usernames)) {
        $usernames[] = $ticket->username;
    }
}

$selectedUser = $_GET["username"] ?? "";

$tickets = [];

if ($selectedUser != "") {
    $ticketQuery = new MongoDB\Driver\Query(
        ["username" => $selectedUser, "status" => true],
        ["sort" => ["created_at" => -1]]
    );

    $tickets = $manager->executeQuery("$database.$collection", $ticketQuery);
}
?>

<h1>Support Ticket List</h1>

<a href="index.php">Back to Homepage</a> |
<a href="create_ticket.php">Create New Ticket</a>

<br><br>

<form method="GET">
    <label>Select Username:</label>

    <select name="username">
        <option value="">-- Select User --</option>

        <?php foreach ($usernames as $user) { ?>
            <option value="<?php echo $user; ?>"
                <?php if ($selectedUser == $user) echo "selected"; ?>>
                <?php echo $user; ?>
            </option>
        <?php } ?>
    </select>

    <button type="submit">View Tickets</button>
</form>

<br>

<?php if (count($usernames) == 0) { ?>

    <p>No active tickets in the system.</p>

<?php } ?>

<?php if ($selectedUser != "") { ?>

    <h2>Active Tickets for <?php echo $selectedUser; ?></h2>

    <table border="1" cellpadding="8">
        <tr>
            <th>Message</th>
            <th>Created At</th>
            <th>Status</th>
            <th>Details/Comments</th>
        </tr>

        <?php foreach ($tickets as $ticket) { ?>
            <tr>
                <td><?php echo $ticket->message; ?></td>
                <td><?php echo $ticket->created_at; ?></td>
                <td><?php echo $ticket->status ? "Active" : "Resolved"; ?></td>
                <td>
                    <a href="ticket_detail.php?id=<?php echo $ticket->_id; ?>">View</a>
                </td>
            </tr>
        <?php } ?>
    </table>

<?php } ?>