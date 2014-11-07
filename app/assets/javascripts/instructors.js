var showReady = function() {
	var instructorId = $('#instructor_id').val();
	$.getJSON("/instructors/" + instructorId + "/marker").done(function(data){
	
		handler = Gmaps.build('Google');
		handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
			handler.map.centerOn(data);
			markers = handler.addMarkers(data);
			handler.bounds.extendWith(markers);
			handler.fitMapToBounds();
			handler.getMap().setZoom(12);
		});
	});

};

$(document).ready(function(){
	if ($('body.instructors.show').length > 0) {
		showReady()
	}
});

$(document).on('page:load', function(){
	if ($('body.instructors.show').length > 0) {
		showReady()
	}
});

var indexReady = function() {
	$.getJSON("/instructors/markers").done(function(data){
	
		handler = Gmaps.build('Google');
		handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
			markers = handler.addMarkers(data);
			handler.bounds.extendWith(markers);
			handler.fitMapToBounds();
		});
	});
	$('.instructor-table').DataTable({
		"order": [[ 5, "asc" ]]
	});
		responsive: true
};

$(document).ready(function(){
	if ($('body.instructors.index').length > 0) {
		indexReady()
	}
});

$(document).on('page:load', function(){
	if ($('body.instructors.index').length > 0) {
		indexReady()
	}
});
