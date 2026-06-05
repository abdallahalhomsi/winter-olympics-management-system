<!DOCTYPE html>
<html>
<head>
    <title>CS306 Phase 4 User Homepage</title>
</head>
<body>

<h1>CS306 Phase 4 User Homepage</h1>

<p>
This homepage provides access to all trigger integrations, stored procedure integrations,
and the support ticket system.
</p>

<hr>

<h2>Triggers</h2>

<div style="border:1px solid #999; padding:10px; margin-bottom:10px;">
    <strong>Trigger 1: Validate Sponsor Contribution</strong>
    <br>
    <strong>Responsible Member:</strong> Abdallah Al Homsi
    <br>
    This trigger checks sponsor contribution values before inserting a sponsor.
    It blocks negative contributions and contributions below 10,000.
    <br>
    <a href="trigger_1.php">Go to Trigger 1 page</a>
</div>

<div style="border:1px solid #999; padding:10px; margin-bottom:10px;">
    <strong>Trigger 2: Prevent Invalid Venue Scheduling</strong>
    <br>
    <strong>Responsible Member:</strong> Rand MO Khaled
    <br>
    This trigger prevents double-booking the same venue at the same date and time.
    It also blocks newly inserted events with Cancelled status.
    <br>
    <a href="trigger_2.php">Go to Trigger 2 page</a>
</div>

<div style="border:1px solid #999; padding:10px; margin-bottom:10px;">
    <strong>Trigger 3: Validate Medal Assignment</strong>
    <br>
    <strong>Responsible Member:</strong> Syeda Manaal Amir
    <br>
    This trigger validates medal assignment based on rank.
    Rank 1 must receive Gold, Rank 2 must receive Silver, Rank 3 must receive Bronze,
    and ranks greater than 3 cannot receive Olympic medals.
    <br>
    <a href="trigger_3.php">Go to Trigger 3 page</a>
</div>

<hr>

<h2>Stored Procedures</h2>

<div style="border:1px solid #999; padding:10px; margin-bottom:10px;">
    <strong>Procedure 1: Get Sponsors Above Contribution</strong>
    <br>
    <strong>Responsible Member:</strong> Abdallah Al Homsi
    <br>
    This stored procedure receives a minimum contribution amount and displays sponsors
    whose contribution is greater than that amount.
    <br>
    <a href="procedure_1.php">Go to Procedure 1 page</a>
</div>

<div style="border:1px solid #999; padding:10px; margin-bottom:10px;">
    <strong>Procedure 2: Get Venue Schedule</strong>
    <br>
    <strong>Responsible Member:</strong> Rand MO Khaled
    <br>
    This stored procedure receives a Venue ID and displays all Olympic events scheduled
    at that venue.
    <br>
    <a href="procedure_2.php">Go to Procedure 2 page</a>
</div>

<div style="border:1px solid #999; padding:10px; margin-bottom:10px;">
    <strong>Procedure 3: Delegation Performance Summary</strong>
    <br>
    <strong>Responsible Member:</strong> Syeda Manaal Amir
    <br>
    This stored procedure receives a Delegation ID and displays the delegation's medal
    counts, total medals, average score, and best rank.
    <br>
    <a href="procedure_3.php">Go to Procedure 3 page</a>
</div>

<hr>

<h2>Support</h2>

<p>
Users can create and manage support tickets through the support ticket system.
</p>

<a href="tickets.php">Go to Support Ticket Page</a>

</body>
</html>