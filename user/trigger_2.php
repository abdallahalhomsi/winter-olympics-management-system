<?php
include "db.php";

$message = "";

function getUniqueEventID($conn) {
    do {
        $id = rand(10000, 99999);
        $check = $conn->query("SELECT EventID FROM OlympicEvent WHERE EventID = $id");
    } while ($check && $check->num_rows > 0);

    return $id;
}

function getFreeVenueSlot($conn, $venueID) {
    do {
        $day = rand(20, 28);
        $hour = rand(8, 20);

        $date = "2026-03-" . $day;
        $time = str_pad($hour, 2, "0", STR_PAD_LEFT) . ":00:00";

        $check = $conn->query("SELECT EventID 
                               FROM OlympicEvent 
                               WHERE VenueID = $venueID 
                               AND DateOfEvent = '$date' 
                               AND TimeOfEvent = '$time'");
    } while ($check && $check->num_rows > 0);

    return [$date, $time];
}

if (isset($_POST["valid"])) {
    $eventID = getUniqueEventID($conn);

    $status = "Scheduled";
    $gender = "Mixed";
    $sportID = 1;
    $venueID = 1;

    list($date, $time) = getFreeVenueSlot($conn, $venueID);

    $sql = "INSERT INTO OlympicEvent (EventID, TimeOfEvent, DateOfEvent, Status, Gender, SportID, VenueID)
            VALUES ($eventID, '$time', '$date', '$status', '$gender', $sportID, $venueID)";

    if ($conn->query($sql)) {
        $message = "Case 1: Free venue time slot<br>
        Tried to add: VenueID $venueID on $date at $time with status $status<br>
        Result: Success. The event was inserted into the database.";
    } else {
        $message = "Case 1 failed.<br>
        Tried to add: VenueID $venueID on $date at $time with status $status<br>
        Error: " . $conn->error;
    }
}

if (isset($_POST["double_booking"])) {
    $eventID = getUniqueEventID($conn);
    $date = "2026-02-06";
    $time = "10:00:00";
    $status = "Scheduled";
    $gender = "Male";
    $sportID = 1;
    $venueID = 2;

    $sql = "INSERT INTO OlympicEvent (EventID, TimeOfEvent, DateOfEvent, Status, Gender, SportID, VenueID)
            VALUES ($eventID, '$time', '$date', '$status', '$gender', $sportID, $venueID)";

    if ($conn->query($sql)) {
        $message = "Case 2: Double booking attempt<br>
        Tried to add: VenueID $venueID on $date at $time with status $status<br>
        Result: This should not happen. The double-booked event was inserted.";
    } else {
        $message = "Case 2: Double booking attempt<br>
        Tried to add: VenueID $venueID on $date at $time with status $status<br>
        Result: Blocked by trigger. The event was not inserted.<br>
        Error: " . $conn->error;
    }
}

if (isset($_POST["cancelled"])) {
    $eventID = getUniqueEventID($conn);

    $date = "2026-02-21";
    $time = "18:00:00";
    $status = "Cancelled";
    $gender = "Mixed";
    $sportID = 1;
    $venueID = 4;

    $sql = "INSERT INTO OlympicEvent (EventID, TimeOfEvent, DateOfEvent, Status, Gender, SportID, VenueID)
            VALUES ($eventID, '$time', '$date', '$status', '$gender', $sportID, $venueID)";

    if ($conn->query($sql)) {
        $message = "Case 3: Cancelled event scheduling attempt<br>
        Tried to add: VenueID $venueID on $date at $time with status $status<br>
        Result: This should not happen. A cancelled event was inserted.";
    } else {
        $message = "Case 3: Cancelled event scheduling attempt<br>
        Tried to add: VenueID $venueID on $date at $time with status $status<br>
        Result: Blocked by trigger. The event was not inserted.<br>
        Error: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Trigger 2</title>
</head>
<body>

<h2>Trigger 2: Prevent Invalid Venue Scheduling</h2>
<p><strong>Responsible Member:</strong> Rand MO Khaled</p>

<p>
This trigger checks venue scheduling before inserting a new Olympic event.
It prevents double-booking the same venue at the same date and time.
It also prevents newly inserting an event with Cancelled status.
</p>

<form method="post">
    <button type="submit" name="valid">Case 1: Insert event in free venue slot</button>
    <button type="submit" name="double_booking">Case 2: Insert double-booked event</button>
    <button type="submit" name="cancelled">Case 3: Insert cancelled event</button>
</form>

<hr>

<h3>Output:</h3>
<p><?php echo $message; ?></p>

<br>
<a href="index.php">Go back to homepage</a>

</body>
</html>