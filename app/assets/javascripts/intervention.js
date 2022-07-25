$(document).ready(function () {
    // retrieve items in the database based on selection of previous section
    // get all customers in database on startup and make them fields in html page.
    $('#customer-email').on('click', function () {
        initBuildings();
    });
});