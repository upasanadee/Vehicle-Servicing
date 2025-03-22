<?php
session_start();
include("config.php");

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user_id = $_SESSION['user_id'];
    $vehicle_id = $_POST['vehicle_id'];
    $mechanic_id = $_POST['mechanic_id'];
    $service_date = $_POST['service_date'];
    $service_time = $_POST['service_time'];

    $sql = "INSERT INTO bookings (user_id, mechanic_id, vehicle_id, service_date, service_time) VALUES 
            ('$user_id', '$mechanic_id', '$vehicle_id', '$service_date', '$service_time')";

    if ($conn->query($sql) === TRUE) {
        echo "<script>alert('Booking Successful!');</script>";
    } else {
        echo "Error: " . $conn->error;
    }
}

$mechanics = $conn->query("SELECT * FROM mechanics");
$vehicles = $conn->query("SELECT * FROM vehicles");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Book Service | Vehicle Service</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body class="bg-light">
<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4 shadow" style="width: 500px;">
        <h3 class="text-center text-primary">Book a Service</h3>
        <form action="" method="POST">
            <div class="mb-3">
                <label class="form-label">Select Vehicle</label>
                <select name="vehicle_id" class="form-control">
                    <?php while ($row = $vehicles->fetch_assoc()) { ?>
                        <option value="<?= $row['id'] ?>"><?= $row['model'] ?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Select Mechanic</label>
                <select name="mechanic_id" class="form-control">
                    <?php while ($row = $mechanics->fetch_assoc()) { ?>
                        <option value="<?= $row['id'] ?>"><?= $row['name'] ?> - <?= $row['specialization'] ?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Date</label>
                <input type="date" name="service_date" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Time</label>
                <input type="time" name="service_time" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success w-100">Book Now</button>
        </form>
        <a href="logout.php" class="btn btn-danger w-100 mt-3">Logout</a>
    </div>
</div>
</body>
</html>
