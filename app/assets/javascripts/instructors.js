var ready = function() {
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
		ready()
	}
});

$(document).on('page:load', function(){
	if ($('body.instructors.show').length > 0) {
		ready()
	}
});

var ready = function() {
	$.getJSON("/instructors/markers").done(function(data){
	
		handler = Gmaps.build('Google');
		handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
			// handler.map.centerOn(data);
			markers = handler.addMarkers(data);
			handler.bounds.extendWith(markers);
			handler.fitMapToBounds();
			// handler.getMap().setZoom(12);
		});
	});
};

$(document).ready(function(){
	if ($('body.instructors.index').length > 0) {
		console.log('index ready')
		ready()
	}
});

$(document).on('page:load', function(){
	console.log('index load')
	if ($('body.instructors.index').length > 0) {
		ready()
	}
});
