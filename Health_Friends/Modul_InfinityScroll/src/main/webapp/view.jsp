<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>우리동네 운동친구∴∵Heath Friends</title>
<style type="text/css">
	div { margin-left: 50px; font-size: 30pt;}
</style>

<script type="text/javascript">

	let cnt = 21;

	onload = function() {
		// 무한스크롤
		window.onscroll = function(ev) {
    		if (((window.innerHeight + window.scrollY) >= document.body.offsetHeight)) {
    			let max = cnt + 10;
        		for (cnt; cnt<max; cnt++) {
        			
        			let wrapper = document.createElement('div');
        			// 재구축한 dom에 태그들 넣어줌
        			wrapper.innerHTML = cnt;	// <div> cnt </div>
        			// body에 <div>cnt</div>를 붙여줌
        			document.body.append(wrapper);
        		}
    		}
		};
	}
</script>

</head>
<body>

	<div>1</div>
	<div>2</div>
	<div>3</div>
	<div>4</div>
	<div>5</div>
	<div>6</div>
	<div>7</div>
	<div>8</div>
	<div>9</div>
	<div>10</div>
	<div>11</div>
	<div>12</div>
	<div>13</div>
	<div>14</div>
	<div>15</div>
	<div>16</div>
	<div>17</div>
	<div>18</div>
	<div>19</div>
	<div>20</div>


</body>
</html>