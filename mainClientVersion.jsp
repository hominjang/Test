<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="mainClientVersion.css">
                
    </head>
    <body>
    		
        	<% 
    		
    		if(session.getAttribute("username")==null){
    			response.sendRedirect("main.jsp");
    		}    	
    	%>
    
    <body onload="build()">  	    
        <div id="wrap">
            <header>
              <a class="logo" href="main.jsp"><img src="logo.jpg"></a>
              <button class="side_menu"><img class="menu_img" src="menu.png"></button>
              <nav>
                <ul class="nav-items">
                  <li><a href="main.html">Home</a></li>
                  <li><a href="#news">News</a></li>
                  <li><a href="#contact">Event</a></li>
                  <li><a href="#about">Help</a></li>
                </ul>
              </nav>
            </header>
        
            <div id="content-wrap">
              <aside>
          <div>
            <img src="userimage.png">
            <a href="ClientEdit.jsp"><%out.println(session.getAttribute("username")); %></a>
            <p>님</p>
            <div>
              <a href="logout.jsp">로그아웃</a>
            </div>
          </div>
         		 <ul>
                  <li><a href="#" class="active">전체 일정</a></li>
                  <li><a href="ClientDelete.jsp">공지사항</a></li>
                  <li><a href="#">패치 노트</a></li>
                  <li><a href="#">커뮤니티</a></li>
                  </ul>
        </aside>
        <table id="calendar">
          <tr>
            <th class="month"><label onclick="beforem()" id="before" ></label></th>
            <th class="thismonth" colspan="5" id="yearmonth"></th>
            <th class="month"><label onclick="nextm()" id="next"></label></td>
          </tr>
          <tr>
            <th> 일 </th>
            <th> 월 </th>
            <th> 화 </th>
            <th> 수 </th>
            <th> 목 </th>
            <th> 금 </th>
            <th> 토 </th>
          </tr>
        </table>
        <div class="daily">일정
          <div class="dailyin">
            <hr>
          </div>
        </div>
      </div>
      <footer>kpu 졸업작품</footer>
      <!-- end of wrap   -->
    </div>
    <script>
          var side_menu = document.querySelector('.side_menu');
          var aside = document.querySelector('aside');
        
          var toggle = (function () {
            var isShow = false;
        
            return function () {
              aside.style.display = isShow ? 'none' : 'block';
              isShow = !isShow;
            };
          })();
          side_menu.onclick = toggle;
          
          var today = new Date(); // 오늘 날짜
          var date = new Date();
     
          function beforem(){ //이전 달을 today에 값을 저장
            today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
            build(); //만들기
          }
              
          function nextm(){  //다음 달을 today에 저장
            today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
            build();
          }
              
          function build(){
            var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
            var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
            var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
            var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
            yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력
                
            if(today.getMonth()+1==12){ //  눌렀을 때 월이 넘어가는 곳
              before.innerHTML=(today.getMonth())+"월";
              next.innerHTML="1월";
            }
            else if(today.getMonth()+1==1){ //  1월 일 때
              before.innerHTML="12월";
              next.innerHTML=(today.getMonth()+2)+"월";
            }
            else{ //   12월 일 때
              before.innerHTML=(today.getMonth())+"월";
              next.innerHTML=(today.getMonth()+2)+"월";
            }
            
            // 남은 테이블 줄 삭제
            while (tbcal.rows.length > 2) {
              tbcal.deleteRow(tbcal.rows.length - 1);
            }
            var row = null;
            row = tbcal.insertRow();
            var cnt = 0;

            // 1일 시작칸 찾기
            for (i = 0; i < nMonth.getDay(); i++) {
              cell = row.insertCell();
              cnt = cnt + 1;
            }
     
            // 달력 출력
            for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
            { 
              cell = row.insertCell();
              cell.innerHTML = i;
              cnt = cnt + 1;
              if (cnt % 7 == 1) {//일요일 계산
                cell.innerHTML = "<font color=#FF9090>" + i//일요일에 색
              }
              if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
                cell.innerHTML = "<font color=#8ca7ff>" + i//토요일에 색
                row = calendar.insertRow();// 줄 추가
              }
              if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate()) 
              {
                cell.bgColor = "#BCF1B1"; //오늘날짜배경색
              }
            }
          }
        </script>
    
          <footer>kpu 졸업작품</footer>
    </body>
</html>