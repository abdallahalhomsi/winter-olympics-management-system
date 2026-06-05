<?php
include "mongo.php";

$query = new MongoDB\Driver\Query(
    ["status" => true],
    ["sort" => ["created_at" => -1]]
);

$tickets = $manager->executeQuery("$database.$collection", $query);
?>

<h1>Admin Ticket Dashboard</h1>

<br><br>

<table border="1" cellpadding="8">
    <tr>
        <th>Username</th>
        <th>Message</th>
        <th>Created At</th>
        <th>Status</th>
        <th>Manage</th>
    </tr>

    <?php foreach ($tickets as $ticket) { ?>
        <tr>
            <td><?php echo $ticket->username; ?></td>
            <td><?php echo $ticket->message; ?></td>
            <td><?php echo $ticket->created_at; ?></td>
            <td><?php echo $ticket->status ? "Active" : "Resolved"; ?></td>
            <td>
                <a href="ticket_detail.php?id=<?php echo $ticket->_id; ?>">Manage</a>
            </td>
        </tr>
    <?php } ?>
</table>