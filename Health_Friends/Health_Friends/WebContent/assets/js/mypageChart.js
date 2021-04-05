	function isTwo(n){
		n = n+'';
		return (n.length<2)?"0"+n:n;
	}
	
	$(function(){
		var individual_id = "<%=Ldto.getMember_id()%>";
		var today = new Date();
		var date = today.getDate();
		var month = today.getMonth()+1 ;
		var year = today.getFullYear();
		var yyyyMMdd = '' + year + isTwo(month) + isTwo(date);
		
		$.ajax({
			type: "post",
			url: "../../chart.do?command=healthRecord&individual_id="+individual_id,
			dataType: "json",
			success: function(msg){
				var todayHealth = msg.todayHealth;
				var yesterdayHealth = msg.yesterdayHealth;
				var twoAgodayHealth = msg.twoAgodayHealth;
				var threeAogdayHealth = msg.threeAogdayHealth;
				var fourAgodayHealth = msg.fourAgodayHealth;
				var fiveAgodayHealth = msg.fiveAgodayHealth;
				var sixAgodayHealth = msg.sixAgodayHealth;
				
				console.log(todayHealth);
				console.log(yesterdayHealth);

				var today = new Date();
				var todayDate = today.getFullYear()+'.'+(today.getMonth()+1)+'.'+today.getDate();

				new Date(today.setDate(today.getDate() - 1));
				var yesterdayDate = today.getFullYear()+'.'+(today.getMonth()+1)+'.'+today.getDate();

				new Date(today.setDate(today.getDate() - 1));
				var twoAgoDate = today.getFullYear()+'.'+(today.getMonth()+1)+'.'+today.getDate();
				
				new Date(today.setDate(today.getDate() - 1));
				var threeAgoDate = today.getFullYear()+'.'+(today.getMonth()+1)+'.'+today.getDate();
				
				new Date(today.setDate(today.getDate() - 1));
				var fourAgoDate = today.getFullYear()+'.'+(today.getMonth()+1)+'.'+today.getDate();
				
				new Date(today.setDate(today.getDate() - 1));
				var fiveAgoDate = today.getFullYear()+'.'+(today.getMonth()+1)+'.'+today.getDate();
				
				new Date(today.setDate(today.getDate() - 1));
				var sixAgoDate = today.getFullYear()+'.'+(today.getMonth()+1)+'.'+today.getDate();
				
				var ctx = document.getElementById("myChart").getContext('2d');
				/*
				- Chart를 생성하면서, 
				- ctx를 첫번째 argument로 넘겨주고, 
				- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줌
				*/
				var myChart = new Chart(ctx, {
				    type: 'line',
				    data: {
				        labels: [sixAgoDate, fiveAgoDate, fourAgoDate, threeAgoDate, twoAgoDate, yesterdayDate, todayDate],
				        datasets: [{
				            label: '운동시간(분)',
				            data: [sixAgodayHealth, fiveAgodayHealth, fourAgodayHealth, threeAogdayHealth, twoAgodayHealth, yesterdayHealth, todayHealth],
				            backgroundColor: [
				                'rgba(255, 99, 132, 0.2)'
				            ],
				            borderColor: [
				                'rgba(255,99,132,1)'
				            ],
				            borderWidth: 1
				        }]
				    },
				    options: {
				        maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
				        scales: {
				            yAxes: [{
				                ticks: {
				                    beginAtZero:true
				                }
				            }]
				        }
				    }
				});
				
			},
			error: function(){
				alert("통신실패");
			}
		});
	});