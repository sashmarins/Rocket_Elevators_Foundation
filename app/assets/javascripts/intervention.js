    //= require jquery

    $(document).ready(function () {

        initCustomers();
        initEmployees();

        $('#customer-email').on('input', function () {
            buildingWipe();
            initBuildings();
        });

        $('#customer-building').on('input', function () {
            batteryWipe();
            initBatteries();
        });

        $('#customer-battery').on('input', function () {
            columnWipe();
            initColumns();
        });

        $('#customer-column').on('input', function () {
            elevatorWipe();
            initElevators();
        });

        function initCustomers() {
            $.ajax({
                type: "GET",
                url: "/customer/search",
                datatype: "json",
                success: function(result) {
                    for (email in result) {
                        $('#customer-email').append(`<option value="${result[email].id}"> ${result[email].email} </option>`);
                    }
                }
            })
        };

        function initEmployees() {
            $.ajax({
                type: "GET",
                url: "/employee/search",
                datatype: "json",
                success: function(result) {
                    for (employee in result) {
                        $('#customer-employee').append(`<option value="${result[employee].id}"> ${result[employee].first_name} ${result[employee].last_name} </option>`);
                    }
                }
            })
        };

        function initBuildings() {
            $('#customer-building-div').show();
            $('#customer-building').append(`<option value="">Select The Building Requiring Maintenence</option>`);
            var customer = $('#customer-email').val();
            $.ajax({
                type: "GET",
                url: "/building/search",
                datatype: "json",
                data: {'custselected': customer},
                success: function(result) {
                    for (building in result) {
                        $('#customer-building').append(`<option value="${result[building].id}"> ${result[building].address} </option>`);
                    }
                }
            })
        };

        function initBatteries() {
            $('#customer-battery-div').show();
            $('#customer-battery').append(`<option value="">Select The Battery Requiring Maintenence</option>`);
            var building = $('#customer-building').val();
            $.ajax({
                type: "GET",
                url: "/battery/search",
                datatype: "json",
                data: {'buildselected': building},
                success: function(result) {
                    for (battery in result) {
                        $('#customer-battery').append(`<option value="${result[battery].id}"> ${result[battery].id} </option>`);
                    }
                }
            })
        };

        function initColumns() {
            $('#customer-column-div').show();
            $('#customer-column').append(`<option value="">No Column Requiring Maintenence</option>`);
            var battery = $('#customer-battery').val();
            $.ajax({
                type: "GET",
                url: "/column/search",
                datatype: "json",
                data: {'batselected': battery},
                success: function(result) {
                    for (column in result) {
                        $('#customer-column').append(`<option value="${result[column].id}"> ${result[column].id} </option>`);
                    }
                }
            })
        };

        function initElevators() {
            $('#customer-elevator-div').show();
            $('#customer-elevator').append(`<option value="">No Elevator Requiring Maintenence</option>`);
            var column = $('#customer-column').val();
            $.ajax({
                type: "GET",
                url: "/elevator/search",
                datatype: "json",
                data: {'colselected': column},
                success: function(result) {
                    for (elevator in result) {
                        $('#customer-elevator').append(`<option value="${result[elevator].id}"> ${result[elevator].serial_number} </option>`);
                    }
                }
            })
        };

        function buildingWipe () {
            $('#customer-building').val('');
            $('#customer-building').empty();
            $('#customer-battery').val('');
            $('#customer-battery').empty();
            $('#customer-column').val('');
            $('#customer-column').empty();
            $('#customer-elevator').val('');
            $('#customer-elevator').empty();
        };

        function batteryWipe () {
            $('#customer-battery').val('');
            $('#customer-battery').empty();
            $('#customer-column').val('');
            $('#customer-column').empty();
            $('#customer-elevator').val('');
            $('#customer-elevator').empty();
        };

        function columnWipe () {
            $('#customer-column').val('');
            $('#customer-column').empty();
            $('#customer-elevator').val('');
            $('#customer-elevator').empty();
        };

        function elevatorWipe () {
            $('#customer-elevator').val('');
            $('#customer-elevator').empty();
        };

    });