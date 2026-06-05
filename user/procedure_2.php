<?php
include "db.php";

$result = null;
$message = "";

function convertTo2026Date($monthDay) {
    // Expected format: MM-DD
    if (!preg_match('/^\d{2}-\d{2}$/', $monthDay)) {
        return false;
    }

    list($month, $day) = explode("-", $monthDay);

    if (!checkdate((int)$month, (int)$day, 2026)) {
        return false;
    }

    return "2026-" . $month . "-" . $day;
}

if (isset($_POST["submit"])) {
    $venueID = $_POST["venueID"];
    $startMonthDay = $_POST["startMonthDay"];
    $endMonthDay = $_POST["endMonthDay"];

    $startDate = convertTo2026Date($startMonthDay);
    $endDate = convertTo2026Date($endMonthDay);

    if ($startDate === false || $endDate === false) {
        $message = "Invalid date format. Please enter dates as MM-DD, for example 02-01.";
    } elseif ($endDate < $startDate) {
        $message = "Invalid date range. End date must be after start date.";
    } else {
        $stmt = $conn->prepare("CALL GetVenueSchedule(?, ?, ?)");
        $stmt->bind_param("iss", $venueID, $startDate, $endDate);

        if ($stmt->execute()) {
            $result = $stmt->get_result();
        } else {
            $message = "Error: " . $conn->error;
        }
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Procedure 2</title>
</head>
<body>

<h2>Procedure 2: Get Venue Schedule</h2>
<p><strong>Responsible Member:</strong> Rand MO Khaled</p>

<p>
This stored procedure receives a Venue ID, start date, and end date.
Since the database is for the 2026 Winter Olympics, the year is fixed as 2026.
The user only enters the month and day in MM-DD format.
</p>

<form method="post">
    <label>Venue ID:</label>
    <input type="number" name="venueID" required>
    <br><br>

    <label>Start Date MM-DD:</label>
    <input type="text" name="startMonthDay" placeholder="02-01" pattern="\d{2}-\d{2}" required>
    <br><br>

    <label>End Date MM-DD:</label>
    <input type="text" name="endMonthDay" placeholder="02-28" pattern="\d{2}-\d{2}" required>
    <br><br>

    <button type="submit" name="submit">Show Venue Schedule</button>
</form>

<hr>

<h3>Output:</h3>

<?php
if ($message != "") {
    echo "<p>$message</p>";
}

if ($result && $result->num_rows > 0) {
    echo "<table border='1' cellpadding='5'>";
    echo "<tr>
            <th>Event ID</th>
            <th>Date</th>
            <th>Time</th>
            <th>Status</th>
            <th>Gender</th>
            <th>Sport</th>
            <th>Venue</th>
            <th>Location</th>
          </tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["EventID"] . "</td>";
        echo "<td>" . $row["DateOfEvent"] . "</td>";
        echo "<td>" . $row["TimeOfEvent"] . "</td>";
        echo "<td>" . $row["Status"] . "</td>";
        echo "<td>" . $row["Gender"] . "</td>";
        echo "<td>" . $row["SportName"] . "</td>";
        echo "<td>" . $row["VenueName"] . "</td>";
        echo "<td>" . $row["Location"] . "</td>";
        echo "</tr>";
    }

    echo "</table>";
} elseif (isset($_POST["submit"]) && $message == "") {
    echo "<p>No events found for this venue and date range.</p>";
}
?>

<br><br>
<a href="index.php">Go back to homepage</a>

</body>
</html>