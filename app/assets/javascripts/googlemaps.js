//= require jquery
$(document).ready(function () {

    initMap();

    function initMap() {
        let uluru = {lat: 39.8283, lng: -98.5795};
        let map = new google.maps.Map(
            $('#map'), {zoom: 4, center: uluru}
        );
        let marker = new google.maps.Marker({position: uluru, map: map})
    };
})