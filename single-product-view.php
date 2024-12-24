<?php

include "connection.php";

$product_rs = Database::search("SELECT * FROM `sizes`");

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Name | UrbanElegance - Stay Elegant, Stay Urban</title>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />

    <style>
        input[type="checkbox"]:checked+label {
            background-color: #000;
            color: #fff;
        }
    </style>

</head>

<body>




    <div class="form-check mt-3">

        <?php

        for ($x = 0; $x < $product_rs->num_rows; $x++) {
            $product_data = $product_rs->fetch_assoc();

        ?>

            <!-- The checkbox -->
            <input class="form-check-input" name="color<?php echo $product_data['size']; ?>" type="checkbox" data-id="<?php echo $product_data['sizes_id']; ?>" id="size_<?php echo $product_data['sizes_id']; ?>" hidden>
            <label class="btn btn-outline-dark" for="size_<?php echo $product_data['sizes_id']; ?>"><?php echo $product_data['size']; ?></label>

        <?php

        }

        ?>


    </div>

    <div class="mt-3 mx-3">
        <button class="btn btn-danger" onclick="submit()">Submit</button>
    </div>




    <!-- End of container -->
    <script src="script.js"></script>
    <script src="js/bootstrap.bundle.js"></script>
</body>

</html>