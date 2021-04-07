
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		selectable: true,
		headerToolbar: {
			left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay'
		},
		dateClick: function(info) {
			var postMdate = document.getElementById('postMdate');
			postMdate.innerHTML = "약속일자 : " + info.dateStr;
			document.getElementsByName("postMdate")[0].value = info.dateStr;
		}
	});
	calendar.render();
});