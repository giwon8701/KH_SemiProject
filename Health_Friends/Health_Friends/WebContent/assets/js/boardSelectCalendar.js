document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		events: [
               {
                   title: '약속일',
                   start: "${dto.postMdate}"
               }
            ]
	});	
    calendar.render();
});	



/***
events: [
               {
                   title: '약속일',
                   start: "${dto.postMdate}"
               }
            ]

 */