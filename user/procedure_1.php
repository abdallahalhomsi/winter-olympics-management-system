<?php
include "db.php";

$result = null;
$message = "";

if (isset($_POST["submit"])) {
    $minContribution = $_POST["minContribution"];
    $maxContribution = $_POST["maxContribution"];
    $tier = $_POST["tier"];

    if ($maxContribution < $minContribution) {
        $message = "Invalid contribution range. Maximum contribution must be higher than minimum contribution.";
    } else {
        $stmt = $conn->prepare("CALL GetSponsorsAboveContribution(?, ?, ?)");
        $stmt->bind_param("dds", $minContribution, $maxContribution, $tier);

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
    <title>Procedure 1</title>
</head>
<body>

<h2>Procedure 1: Show Sponsors by Contribution Range and Tier</h2>
<p><strong>Responsible Member:</strong> Abdallah Al Homsi</p>

<p>
This stored procedure receives a minimum contribution, maximum contribution, and sponsor tier.
It displays sponsors that match all three conditions.
</p>

<form method="post">
    <label>Minimum Contribution:</label>
    <input type="number" name="minContribution" step="0.01" min="0" required>
    <br><br>

    <label>Maximum Contribution:</label>
    <input type="number" name="maxContribution" step="0.01" min="0" required>
    <br><br>

    <label>Tier:</label>
    <select name="tier" required>
        <option value="Gold">Gold</option>
        <option value="Silver">Silver</option>
        <option value="Bronze">Bronze</option>
    </select>
    <br><br>

    <button type="submit" name="submit">Call Procedure</button>
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
            <th>Sponsor ID</th>
            <th>Name</th>
            <th>Tier</th>
            <th>Contribution</th>
          </tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["SponsorID"] . "</td>";
        echo "<td>" . $row["Name"] . "</td>";
        echo "<td>" . $row["Tier"] . "</td>";
        echo "<td>" . $row["Contribution"] . "</td>";
        echo "</tr>";
    }

    echo "</table>";
} elseif (isset($_POST["submit"]) && $message == "") {
    echo "<p>No sponsors found for this contribution range and tier.</p>";
}
?>

<br><br>
<a href="index.php">Go back to homepage</a>

</body>
</html>