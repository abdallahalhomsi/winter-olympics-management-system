<?php
include "db.php";

$message = "";

function randomSponsorName() {
    $prefixes = ["Alpine", "Nordic", "SnowPeak", "IceStar", "WinterPro", "Glacier", "Olympic", "Frost"];
    $suffixes = ["Group", "Partners", "Company", "Holdings", "Sports", "Global", "Enterprise", "Brand"];

    return $prefixes[array_rand($prefixes)] . " " . $suffixes[array_rand($suffixes)] . " " . rand(100, 999);
}

function randomTier() {
    $tiers = ["Gold", "Silver", "Bronze"];
    return $tiers[array_rand($tiers)];
}

if (isset($_POST["valid"])) {
    $id = rand(1000, 9999);
    $name = randomSponsorName();
    $tier = randomTier();
    $contribution = rand(10000, 500000);

    $sql = "INSERT INTO Sponsor (SponsorID, Name, Tier, Contribution)
            VALUES ($id, '$name', '$tier', $contribution)";

    if ($conn->query($sql) === TRUE) {

        $message = "Case 1 successful: valid sponsor was accepted by the trigger.<br>
        Temporary Sponsor Name: $name<br>
        Tier: $tier<br>
        Contribution: $contribution<br>";
    } else {
        $message = "Error: " . $conn->error;
    }
}

if (isset($_POST["negative"])) {
    $id = rand(1000, 9999);

    $sql = "INSERT INTO Sponsor (SponsorID, Name, Tier, Contribution)
            VALUES ($id, 'Test Negative Sponsor', 'Bronze', -5000)";

    if ($conn->query($sql) === TRUE) {
        $message = "This should not happen. Negative contribution was inserted.";
    } else {
        $message = "Case 2 successful: trigger blocked negative contribution.<br>
        Attempted Sponsor Name: Test Negative Sponsor<br>
        Tier: Bronze<br>
        Contribution: -5000<br>
        Error: " . $conn->error;
    }
}

if (isset($_POST["below_threshold"])) {
    $id = rand(1000, 9999);

    $sql = "INSERT INTO Sponsor (SponsorID, Name, Tier, Contribution)
            VALUES ($id, 'Test Low Sponsor', 'Bronze', 5000)";

    if ($conn->query($sql) === TRUE) {
        $message = "This should not happen. Below-threshold contribution was inserted.";
    } else {
        $message = "Case 3 successful: trigger blocked contribution below 10,000.<br>
        Attempted Sponsor Name: Test Low Sponsor<br>
        Tier: Bronze<br>
        Contribution: 5000<br>
        Error: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Trigger 1</title>
</head>
<body>

<h2>Trigger 1: Validate Sponsor Contribution</h2>
<p><strong>Responsible Member:</strong> Abdallah Al Homsi</p>

<p>
This trigger checks the contribution before inserting a sponsor.
It blocks negative contributions and contributions below 10,000.
</p>

<form method="post">
    <button type="submit" name="valid">Case 1: Insert random valid sponsor</button>
    <button type="submit" name="negative">Case 2: Insert sponsor with negative contribution</button>
    <button type="submit" name="below_threshold">Case 3: Insert sponsor below minimum threshold</button>
</form>

<hr>

<h3>Output:</h3>
<p><?php echo $message; ?></p>

<br>
<a href="index.php">Go back to homepage</a>

</body>
</html>