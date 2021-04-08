document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
    events: [
               {
                   title: "우리동네 운동친구∴∵Heath Friends",
                   start: "${dto.postMdate},
               }
            ]
	});	
    calendar.render();
});	

