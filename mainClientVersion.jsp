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
            <p>��</p>
            <div>
              <a href="logout.jsp">�α׾ƿ�</a>
            </div>
          </div>
         		 <ul>
                  <li><a href="#" class="active">��ü ����</a></li>
                  <li><a href="ClientDelete.jsp">��������</a></li>
                  <li><a href="#">��ġ ��Ʈ</a></li>
                  <li><a href="#">Ŀ�´�Ƽ</a></li>
                  </ul>
        </aside>
        <table id="calendar">
          <tr>
            <th class="month"><label onclick="beforem()" id="before" ></label></th>
            <th class="thismonth" colspan="5" id="yearmonth"></th>
            <th class="month"><label onclick="nextm()" id="next"></label></td>
          </tr>
          <tr>
            <th> �� </th>
            <th> �� </th>
            <th> ȭ </th>
            <th> �� </th>
            <th> �� </th>
            <th> �� </th>
            <th> �� </th>
          </tr>
        </table>
        <div class="daily">����
          <div class="dailyin">
            <hr>
          </div>
        </div>
      </div>
      <footer>kpu ������ǰ</footer>
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
          
          var today = new Date(); // ���� ��¥
          var date = new Date();
     
          function beforem(){ //���� ���� today�� ���� ����
            today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
            build(); //�����
          }
              
          function nextm(){  //���� ���� today�� ����
            today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
            build();
          }
              
          function build(){
            var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //������� ù° ��
            var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //���� ���� ������ ��
            var tbcal = document.getElementById("calendar"); // ���̺� �޷��� ���� ���̺�
            var yearmonth = document.getElementById("yearmonth"); //  �⵵�� �� ����Ұ�
            yearmonth.innerHTML = today.getFullYear() + "�� "+ (today.getMonth() + 1) + "��"; //�⵵�� �� ���
                
            if(today.getMonth()+1==12){ //  ������ �� ���� �Ѿ�� ��
              before.innerHTML=(today.getMonth())+"��";
              next.innerHTML="1��";
            }
            else if(today.getMonth()+1==1){ //  1�� �� ��
              before.innerHTML="12��";
              next.innerHTML=(today.getMonth()+2)+"��";
            }
            else{ //   12�� �� ��
              before.innerHTML=(today.getMonth())+"��";
              next.innerHTML=(today.getMonth()+2)+"��";
            }
            
            // ���� ���̺� �� ����
            while (tbcal.rows.length > 2) {
              tbcal.deleteRow(tbcal.rows.length - 1);
            }
            var row = null;
            row = tbcal.insertRow();
            var cnt = 0;

            // 1�� ����ĭ ã��
            for (i = 0; i < nMonth.getDay(); i++) {
              cell = row.insertCell();
              cnt = cnt + 1;
            }
     
            // �޷� ���
            for (i = 1; i <= lastDate.getDate(); i++) // 1�Ϻ��� ������ �ϱ���
            { 
              cell = row.insertCell();
              cell.innerHTML = i;
              cnt = cnt + 1;
              if (cnt % 7 == 1) {//�Ͽ��� ���
                cell.innerHTML = "<font color=#FF9090>" + i//�Ͽ��Ͽ� ��
              }
              if (cnt % 7 == 0) { // 1������ 7�� �̹Ƿ� ����� ���
                cell.innerHTML = "<font color=#8ca7ff>" + i//����Ͽ� ��
                row = calendar.insertRow();// �� �߰�
              }
              if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate()) 
              {
                cell.bgColor = "#BCF1B1"; //���ó�¥����
              }
            }
          }
        </script>
    
          <footer>kpu ������ǰ</footer>
    </body>
</html>