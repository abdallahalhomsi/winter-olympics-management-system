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
    $delegationID = $_POST["delegationID"];
    $startMonthDay = $_POST["startMonthDay"];
    $endMonthDay = $_POST["endMonthDay"];

    $startDate = convertTo2026Date($startMonthDay);
    $endDate = convertTo2026Date($endMonthDay);

    if ($startDate === false || $endDate === false) {
        $message = "Invalid date format. Please enter dates as MM-DD, for example 02-01.";
    } elseif ($endDate < $startDate) {
        $message = "Invalid date range. End date must be after start date.";
    } else {
        $stmt = $conn->prepare("CALL GetDelegationPerformanceSummary(?, ?, ?)");
        $stmt->bind_param("iss", $delegationID, $startDate, $endDate);

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
    <title>Procedure 3</title>
</head>
<body>

<h2>Procedure 3: Delegation Performance Summary</h2>
<p><strong>Responsible Member:</strong> Syeda Manaal Amir</p>

<p>
This stored procedure receives a Delegation ID, start date, and end date.
Since the database is for the 2026 Winter Olympics, the year is fixed as 2026.
The user only enters the month and day in MM-DD format.
</p>

<form method="post">
    <label>Delegation ID:</label>
    <input type="number" name="delegationID" required>
    <br><br>

    <label>Start Date MM-DD:</label>
    <input type="text" name="startMonthDay" placeholder="02-01" pattern="\d{2}-\d{2}" required>
    <br><br>

    <label>End Date MM-DD:</label>
    <input type="text" name="endMonthDay" placeholder="02-28" pattern="\d{2}-\d{2}" required>
    <br><br>

    <button type="submit" name="submit">Generate Performance Summary</button>
</form>

<hr>

<h3>Output:</h3>

<?php
if ($message != "") {
    echo "<p>$message</p>";
}

if ($result && $result->num_rows > 0) {
    $row = $result->fetch_assoc();

    echo "<table border='1' cellpadding='5'>";
    echo "<tr><th>Attribute</th><th>Value</th></tr>";

    echo "<tr><td>Delegation Name</td><td>" . $row["DelegationName"] . "</td></tr>";
    echo "<tr><td>Country Code</td><td>" . $row["CountryCode"] . "</td></tr>";
    echo "<tr><td>Total Teams</td><td>" . $row["TotalTeams"] . "</td></tr>";
    echo "<tr><td>Gold Medals</td><td>" . $row["GoldMedals"] . "</td></tr>";
    echo "<tr><td>Silver Medals</td><td>" . $row["SilverMedals"] . "</td></tr>";
    echo "<tr><td>Bronze Medals</td><td>" . $row["BronzeMedals"] . "</td></tr>";
    echo "<tr><td>Total Medals</td><td>" . $row["TotalMedals"] . "</td></tr>";
    echo "<tr><td>Average Score</td><td>" . $row["AverageScore"] . "</td></tr>";
    echo "<tr><td>Best Rank</td><td>" . $row["BestRank"] . "</td></tr>";

    echo "</table>";
} elseif (isset($_POST["submit"]) && $message == "") {
    echo "<p>No delegation found for this ID and date range.</p>";
}
?>

<br><br>
<a href="index.php">Go back to homepage</a>

</body>
</html>