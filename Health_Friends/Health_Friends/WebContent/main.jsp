<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 운동친구∴∵Heath Friends</title>
<style>
	html,body {width:100%;height:100%;margin:0px;padding:0px;overflow:hidden;font-family:sans-serif; }
	
	#fullpage {position:relative;top:0px;z-index:9;width:100%;height:100%;}
	.fullsection{width:100%;height:100%;position:relative;}
	.full1{height: 100vh; background-color: #4481eb; background-image: url("images/main/slide01.svg"); background-repeat: no-repeat; background-size: cover;}
	.full2{height: 100vh; background-color: #04befe; background-image: url("images/main/slide02.svg"); background-repeat: no-repeat; background-size: cover;}
	.full3{height: 100vh; background-color: #4481eb; background-image: url("images/main/slide03.svg"); background-repeat: no-repeat; background-size: cover;}
	.full4{height: 100vh; background-color: #04befe; background-image: url("images/main/slide04.svg"); background-repeat: no-repeat; background-size: cover;}
	.full5{height: 100vh; background-color: #4481eb; background-image: url("images/main/slide05.svg"); background-repeat: no-repeat; background-size: cover;}
	#fullpage span{display:block;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);color:#000000;font-size:4em;font-weight:bold; text-align: center;}
	.full2 span{color:#000;}

	ul, li{margin:0;padding:0;list-style:none}
	.quick {position:fixed;right:20px;top:50%;transform:translateY(-50%); z-index:100000}
	.quick li {width:10px;height:10px;margin-bottom:10px; border-radius:15px;border:2px solid #fff;cursor:pointer;}
	.quick .on {background:#fff;}
</style>
</head>
<body>
<%@ include file="header.jsp" %>

	<div id="fullpage">
		<div class='quick'><ul></ul></div>
		<div class="fullsection full1" pageNum="1">
			<span>달려보세요!</span>
		</div>
		<div class="fullsection full2" pageNum="2">
			<span>자전거를 타고</span>
		</div>
		<div class="fullsection full3" pageNum="3">
			<span>가까운 동네 친구를</span>
		</div>
		<div class="fullsection full4" pageNum="4">
			<span>규칙적인 생활</span>
		</div>
		<div class="fullsection full5" pageNum="5">
			<span>우리 동네 운동 메이트</span>
		</div>
	</div>
	
	<section>
        <span>
            <button class="main-button" onclick="location.href='board.do?command=list'">
                운동약속<br> 하러가기
            </button>
        </span>
    </section>
	
</body>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script>
    $(document).ready(function(){ fullset(); quickClick(); }); function fullset(){ var pageindex = $("#fullpage > .fullsection").size(); //fullpage 안에 섹션이(.fullsection) 몇개인지 확인하기 
        for(var i=1;i<=pageindex;i++){ 
            $("#fullpage > .quick > ul").append("<li></li>"); 
            } 
            $("#fullpage .quick ul :first-child").addClass("on"); //일단 화면이 로드 되었을때는 퀵버튼에 1번째에 불이 들어오게 
            //마우스 휠 이벤트 
            $(window).bind("mousewheel", function(event){ var page = $(".quick ul li.on"); //alert(page.index()+1); 
            // 현재 on 되어있는 페이지 번호 
            if($("body").find("#fullpage:animated").length >= 1) return false;
            //마우스 휠을 위로 
            if(event.originalEvent.wheelDelta >= 0) { 
                var before=page.index(); 
                if(page.index() >= 0) page.prev().addClass("on").siblings(".on").removeClass("on");//퀵버튼옮기기 
                var pagelength=0; 
                for(var i=1; i<(before); i++) 
                { 
                    pagelength += $(".full"+i).height(); 
                } 
                if(page.index() > 0){ //첫번째 페이지가 아닐때 (index는 0부터 시작임) 
                    page=page.index()-1; 
                    $("#fullpage").animate({"top": -pagelength + "px"},700, "swing"); 
                }
            }else{ // 마우스 휠을 아래로 
                var nextPage=parseInt(page.index()+1); //다음페이지번호 
                var lastPageNum=parseInt($(".quick ul li").size()); //마지막 페이지번호 
                //현재페이지번호 <= (마지막 페이지 번호 - 1) 
                //이럴때 퀵버튼옮기기 
                if(page.index() <= $(".quick ul li").size()-1){ 
                    page.next().addClass("on").siblings(".on").removeClass("on"); 
                } if(nextPage < lastPageNum){ //마지막 페이지가 아닐때만 animate ! 
                    var pagelength=0; 
                    for(var i = 1; i<(nextPage+1); i++){ 
                        //총 페이지 길이 구하기 
                        //ex) 현재 1번페이지에서 2번페이지로 내려갈때는 1번페이지 길이 + 2번페이지 길이가 더해짐 
                        pagelength += $(".full"+i).height(); 
                    } 
                    $("#fullpage").animate({"top": -pagelength + "px"},700, "swing"); 
                } 
            } 
        }); 
        $(window).resize(function(){ 
            //페이지가 100%이기때문에 브라우저가 resize 될때마다 스크롤 위치가 그대로 남아있는것을 방지하기 위해 
            var resizeindex = $(".quick ul li.on").index()+1;

            var pagelength=0; 
            for(var i = 1; i<resizeindex; i++){ 
                //총 페이지 길이 구하기 
                //ex) 현재 1번페이지에서 2번페이지로 내려갈때는 1번페이지 길이 + 2번페이지 길이가 더해짐 
                pagelength += $(".full"+i).height(); 
            } 
            $("#fullpage").animate({"top": -pagelength + "px"},0); 
        }); 
    } 
    // 사이드 퀵버튼 클릭 이동 
    function quickClick(){ 
        $(".quick li").click(function(){ 
            var gnbindex = $(this).index()+1; 
            var length=0; 
            for(var i=1; i<(gnbindex); i++) 
            { 
                length+=$(".full"+i).height(); 
            }
            if($("body").find("#fullpage:animated").length >= 1) return false; 
            $(this).addClass("on").siblings("li").removeClass("on"); 
            
            $("#fullpage").animate({"top": -length + "px"},800, "swing");
            return false; 
        }); 
    }


    </script>
</html>