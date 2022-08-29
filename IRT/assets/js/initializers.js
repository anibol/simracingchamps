// Run javascript after DOM is initialized
$(document).ready(function() {

    $('#map_canvas').mapit({
        latitude: -6.970996,
        longitude: 36.730542,
        zoom: 16,
        type: 'ROADMAP',
        scrollwheel: false
    });

});