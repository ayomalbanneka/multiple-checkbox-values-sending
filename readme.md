# Multiple Checkbox Values Sending with PHP, HTML, CSS, and JavaScript

This repository demonstrates how to handle and send multiple checkbox values from a form using **HTML**, **CSS**, **JavaScript**, and **PHP**. It includes a backend PHP script that processes the selected checkbox values and inserts them into a database. This is a simple example to help you understand how to capture, send, and process multiple checkbox selections in a web application.

---

## Features

- **Multiple Checkbox Selection**: Users can select multiple options from a list of checkboxes.
- **Form Submission**: The selected checkbox values are sent to the server using JavaScript's `XMLHttpRequest`.
- **Backend Processing**: The PHP script processes the selected values and inserts them into a database (if they don't already exist).
- **Database Integration**: Uses MySQL to store and manage the data.

---

## Technologies Used

- **Frontend**: HTML, CSS, JavaScript
- **Backend**: PHP
- **Database**: MySQL

---

## Getting Started

### Prerequisites

- A web server with PHP and MySQL support (e.g., XAMPP, WAMP, or LAMP).
- Basic knowledge of HTML, CSS, JavaScript, and PHP.

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/ayomalbanneka/multiple-checkbox-values-sending.git
   cd multiple-checkbox-values-sending
   ```

2. **Set Up the Database**:
   - Run the cb.sql in the database folder to create the database. Add data if they don't already exist  
    

3. **Update Database Connection**:
   - Open the `connection.php` file and update the database connection details:
     ```php
     class Database
     {
         public static $connection;

         public static function setUpConnection()
         {
             if (!isset(Database::$connection)) {
                 Database::$connection = new mysqli("localhost", "root", "", "your_database_name");
             }
         }

         public static function iud($q)
         {
             Database::setUpConnection();
             Database::$connection->query($q);
         }

         public static function search($q)
         {
             Database::setUpConnection();
             $resultset = Database::$connection->query($q);
             return $resultset;
         }
     }
     ```

4. **Run the Application**:
   - Place the project folder in your web server's root directory (e.g., `htdocs` for XAMPP).
   - Open your browser and navigate to `http://localhost/multiple-checkbox-values-sending`.

---

## Usage

1. **Select Checkboxes**: Choose one or more options from the list of checkboxes.
2. **Submit the Form**: Click the "Submit" button to send the selected values to the server.
3. **View Results**: The server will process the selected values and display a success message or indicate if the values already exist in the database.

---

## Code Overview

### Frontend (HTML + JavaScript)

- **HTML Form**: The form contains multiple checkboxes and a button to trigger the submission.
  ```html
  <form>
      <input type="checkbox" id="size_1" data-id="1"> Size 1<br>
      <input type="checkbox" id="size_2" data-id="2"> Size 2<br>
      <input type="checkbox" id="size_3" data-id="3"> Size 3<br>
      <button type="button" onclick="submit()">Submit</button>
  </form>
  ```

- **JavaScript**: Handles form submission and sends the selected values to the server using `XMLHttpRequest`.
  ```javascript
  function submit() {
      // Get all checkboxes with an id starting with "size_"
      const checkboxes = document.querySelectorAll("[id^='size_']");
      const selectedList = [];

      // Loop through all checkboxes and add the selected ones to the list
      checkboxes.forEach(checkbox => {
          if (checkbox.checked) {
              selectedList.push(checkbox.getAttribute("data-id"));
          }
      });

      // If no checkboxes are selected, alert the user
      if (selectedList.length === 0) {
          alert("Please select at least one size.");
          return;
      }

      // Send the selected checkboxes to the server
      const request = new XMLHttpRequest();
      request.onreadystatechange = function () {
          if (request.readyState === 4 && request.status === 200) {
              alert(request.responseText);
          }
      };

      const form = new FormData();
      form.append("sid", selectedList.join(','));

      request.open("POST", "submit.php", true);
      request.send(form);
  }
  ```

### Backend (PHP)

- **PHP Script**: Processes the selected checkbox values and inserts them into the database.
  ```php
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
  ?>
  ```
