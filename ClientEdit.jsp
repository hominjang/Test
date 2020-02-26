<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="ClientEdit.css">
    </head>
    <body> 
    <script type="text/javascript">
    function checkValue()
    {
    	var regExpName = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
      	var form = document.userInfo;
      	        
        if(!form.user_pw.value){
            alert("비밀번호를 입력하세요.");
            return false;
        }
        
        // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
        if(form.user_pw.value != form.user_pw2.value ){
            alert("비밀번호를 동일하게 입력하세요.");
            return false;
        }
   		
        if(!regExpName.test(form.user_name.value)){
        	alert("한글만 입력해주세요.");
            return false;
        }
    }    
    </script>    
        <div id="wrap">
            <header>
              <a class="logo" href="main.jsp"><img src="logo.jpg"></a>
              <nav>
                <ul class="nav-items">
                  <li><a href="main.html">Home</a></li>
                  <li><a href="#news">News</a></li>
                  <li><a href="#contact">Event</a></li>
                  <li><a href="#about">Help</a></li>
                </ul>
              </nav>
            </header>
            <div class="form">
                <h1>회원정보 변경</h1>
                <form name="ClientEdit" method="get" action="ClientEditSelect.jsp" onsubmit="return checkValue()">
                    <table>
                        <tr>
                            <td>아이디*</td>
                            <td><input type="text" value="<%out.println(session.getAttribute("username")); %>" name="user_id" disabled/></td>
                        </tr>
                        <tr>
                            <td>비밀번호*</td>
                            <td><input type="password" name="user_pw" /></td>
                        </tr>
                        <tr>
                            <td>비밀번호 확인*</td>
                            <td><input type="password" name="user_pw2" /></td>
                        </tr>
                        <tr>
                            <td>이름*</td>
                            <td><input type="text" name="user_name" /></td>
                        </tr>
                        <tr>
                            <td>생년월일*</td>
                            <td><select name="user_birth_year">
                                    <option value="2020">2020</option>
                                    <option value="2019">2019</option>
                                    <option value="2018">2018</option>
                                    <option value="2017">2017</option>
                                    <option value="2016">2016</option>
                                    <option value="2015">2015</option>
                                    <option value="2014">2014</option>
                                    <option value="2013">2013</option>
                                    <option value="2012">2012</option>
                                    <option value="2011">2011</option>
                                    <option value="2010">2010</option>
                                    <option value="2009">2009</option>
                                    <option value="2008">2008</option>
                                    <option value="2007">2007</option>
                                    <option value="2006">2006</option>
                                    <option value="2005">2005</option>
                                    <option value="2004">2004</option>
                                    <option value="2003">2003</option>
                                    <option value="2002">2002</option>
                                    <option value="2001">2001</option>
                                    <option value="2000">2000</option>
                                    <option value="1999">1999</option>
                                    <option value="1998">1998</option>
                                    <option value="1997">1997</option>
                                    <option value="1996">1996</option>
                                    <option value="1995">1995</option>
                                    <option value="1994">1994</option>
                                    <option value="1993">1993</option>
                                    <option value="1992">1992</option>
                                    <option value="1991">1991</option>
                                    <option value="1990">1990</option>
                                    <option value="1989">1989</option>
                                    <option value="1988">1988</option>
                                    <option value="1987">1987</option>
                                    <option value="1986">1986</option>
                                    <option value="1985">1985</option>
                                    <option value="1984">1984</option>
                                    <option value="1983">1983</option>
                                    <option value="1982">1982</option>
                                    <option value="1981">1981</option>
                                    <option value="1980">1980</option>
                                    <option value="1979">1979</option>
                                    <option value="1978">1978</option>
                                    <option value="1977">1977</option>
                                    <option value="1976">1976</option>
                                    <option value="1975">1975</option>
                                    <option value="1974">1974</option>
                                    <option value="1973">1973</option>
                                    <option value="1972">1972</option>
                                    <option value="1971">1971</option>
                                    <option value="1970">1970</option>
                                    <option value="1969">1969</option>
                                    <option value="1968">1968</option>
                                    <option value="1967">1967</option>
                                    <option value="1966">1966</option>
                                    <option value="1965">1965</option>
                                    <option value="1964">1964</option>
                                    <option value="1963">1963</option>
                                    <option value="1962">1962</option>
                                    <option value="1961">1961</option>
                                    <option value="1960">1960</option>
                                    <option value="1959">1959</option>
                                </select>
                                년
                                <select name="user_birth_month">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>
                                월
                                <select name="user_birth_day">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                </select>
                                일
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td><input type="text" name="user_address" /></td>
                        </tr>
                        <tr>
                            <td>직업</td>
                            <td><input type="text" name="user_job" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" name="submit" value="완료" />&nbsp;
                            <input type="reset" name="reset" value="리셋" /></td>
                        </tr>
                    </table>
                </form>
                <div class="notice">*은 필수 입력사항입니다</div>
            </div>
            <footer>kpu 졸업작품</footer>
          <!-- end of wrap   -->
        </div>
    </body>
</html>