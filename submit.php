<?php
// Database connection
include "connection.php";

$storeId = 2;

// Assuming 'sids' is a comma-separated string of size IDs
$sids_string = $_POST['sid'];  // Example: "1,2,3,4"

// Convert the comma-separated string into an array
$sids = explode(',', $sids_string);

// Loop through each SID to handle the insertions
foreach ($sids as $sid) {
    // Trim any extra whitespace
    $sid = trim($sid);

    // Check if this combination of store_id and sizes_sizes_id already exists
    $phs_rs = Database::search("SELECT * FROM `sizes_has_store` WHERE 
    `store_id` = '" . $storeId . "' AND `sizes_sizes_id` = '" . $sid . "'");

    if ($phs_rs->num_rows == 0) {
        // If not exists, insert the new combination
        Database::iud("INSERT INTO `sizes_has_store`(`store_id`,`sizes_sizes_id`) 
        VALUES ('" . $storeId . "','" . $sid . "')");

        // Optionally, you can output a message for each successful insertion
        echo ("Size ID " . $sid . " inserted successfully!<br>");
    } else {
        // Optionally, you can output a message if the combination already exists
        echo ("Size ID " . $sid . " already exists in the store.<br>");
    }
}

// if (isset($_POST['sid'])) {
//     $sid = $_POST['sid'];
//     $storeId = 1;

//     Database::iud("INSERT INTO `sizes_has_store` (`store_id`, `sizes_sizes_id`) VALUES ('$storeId', '$sid')");

//     echo ("Data inserted successfully!");
// } else {
//     echo "Invalid data received!";
// }
