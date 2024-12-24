function submit() {

    // Get all checkboxes with an id starting with "size_"
    const checkboxes = document.querySelectorAll("[id^='size_']");
    const selectedList = [];
    
    // Loop through all checkboxes and add the selected ones to the list of selected checkboxes
    checkboxes.forEach(checkbox => {
        if (checkbox.checked) {
            selectedList.push(checkbox.getAttribute("data-id"));
        }
    });

    // If no checkboxes are selected, alert the user
    const request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if (request.readyState === 4 && request.status === 200) {
            alert(request.responseText);
        }
    };

    // Send the selected checkboxes to the server
    const form = new FormData();
    form.append("sid", selectedList.join(','));

    request.open("POST", "submit.php", true);
    request.send(form);
}
