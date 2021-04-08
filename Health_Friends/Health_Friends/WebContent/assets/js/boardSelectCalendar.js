
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		selectable: false,
		headerToolbar: {
			left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay'
		}
	});
	calendar.render();
});
$(function() {

	 $('#calendar').fullCalendar({
	    events: [
	        {
	            title:  'Event',
	            start:  '${dto.postMdate}',
	        }
	    ],
	    displayEventTime: false,
	});

});