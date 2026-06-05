<?php
include "db.php";

$message = "";

function getUniqueID($conn, $table, $column) {
    do {
        $id = rand(10000, 99999);
        $check = $conn->query("SELECT $column FROM $table WHERE $column = $id");
    } while ($check && $check->num_rows > 0);

    return $id;
}

function createTempTeam($conn) {
    $teamID = getUniqueID($conn, "Team", "TeamID");

    // DelegationID = 1 already exists in the database
    $sql = "INSERT INTO Team (TeamID, NumberOfAthletes, DelegationID)
            VALUES ($teamID, 4, 1)";

    if ($conn->query($sql)) {
        return $teamID;
    } else {
        return false;
    }
}

if (isset($_POST["valid"])) {
    $resultID = getUniqueID($conn, "Result", "ResultID");
    $teamID = createTempTeam($conn);

    if ($teamID === false) {
        $message = "Case 1 failed.<br>Error creating temporary team: " . $conn->error;
    } else {
        $rank = 1;
        $medal = "Gold";

        $sql = "INSERT INTO Result (ResultID, Scores, `Rank`, Medal, EventID, TeamID)
                VALUES ($resultID, 98.00, $rank, '$medal', 3, $teamID)";

        if ($conn->query($sql)) {
            $message = "Case 1: Valid medal assignment<br>
            Tried to add: Rank $rank with $medal medal<br>
            Result: Success. The result was inserted into the database.";
        } else {
            $message = "Case 1: Valid medal assignment<br>
            Tried to add: Rank $rank with $medal medal<br>
            Result: Failed.<br>
            Error: " . $conn->error;
        }
    }
}

if (isset($_POST["wrong_medal"])) {
    $resultID = getUniqueID($conn, "Result", "ResultID");
    $teamID = createTempTeam($conn);

    if ($teamID === false) {
        $message = "Case 2 failed.<br>Error creating temporary team: " . $conn->error;
    } else {
        $rank = 1;
        $medal = "Bronze";

        $sql = "INSERT INTO Result (ResultID, Scores, `Rank`, Medal, EventID, TeamID)
                VALUES ($resultID, 92.00, $rank, '$medal', 3, $teamID)";

        if ($conn->query($sql)) {
            $message = "Case 2: Incorrect medal assignment<br>
            Tried to add: Rank $rank with $medal medal<br>
            Result: This should not happen. The invalid result was inserted.";
        } else {
            $message = "Case 2: Incorrect medal assignment<br>
            Tried to add: Rank $rank with $medal medal<br>
            Result: Blocked by trigger. The result was not inserted.<br>
            Error: " . $conn->error;
        }

        // Remove temporary team because the invalid result was not inserted
        $conn->query("DELETE FROM Team WHERE TeamID = $teamID");
    }
}

if (isset($_POST["invalid_rank"])) {
    $resultID = getUniqueID($conn, "Result", "ResultID");
    $teamID = createTempTeam($conn);

    if ($teamID === false) {
        $message = "Case 3 failed.<br>Error creating temporary team: " . $conn->error;
    } else {
        $rank = 5;
        $medal = "Gold";

        $sql = "INSERT INTO Result (ResultID, Scores, `Rank`, Medal, EventID, TeamID)
                VALUES ($resultID, 70.00, $rank, '$medal', 3, $teamID)";

        if ($conn->query($sql)) {
            $message = "Case 3: Medal assigned to invalid rank<br>
            Tried to add: Rank $rank with $medal medal<br>
            Result: This should not happen. The invalid result was inserted.";
        } else {
            $message = "Case 3: Medal assigned to invalid rank<br>
            Tried to add: Rank $rank with $medal medal<br>
            Result: Blocked by trigger. The result was not inserted.<br>
            Error: " . $conn->error;
        }

        // Remove temporary team because the invalid result was not inserted
        $conn->query("DELETE FROM Team WHERE TeamID = $teamID");
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Trigger 3</title>
</head>
<body>

<h2>Trigger 3: Validate Medal Assignment</h2>
<p><strong>Responsible Member:</strong> Syeda Manaal Amir</p>

<p>
This trigger checks the medal before inserting a result.
It ensures Rank 1 receives Gold, Rank 2 receives Silver, Rank 3 receives Bronze,
and ranks greater than 3 cannot receive Olympic medals.
</p>

<form method="post">
    <button type="submit" name="valid">Case 1: Insert valid Gold medal result</button>
    <button type="submit" name="wrong_medal">Case 2: Insert Rank 1 with Bronze</button>
    <button type="submit" name="invalid_rank">Case 3: Insert Rank 5 with Gold</button>
</form>

<hr>

<h3>Output:</h3>
<p><?php echo $message; ?></p>

<br>
<a href="index.php">Go back to homepage</a>

</body>
</html>