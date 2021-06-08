<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="../assets/JS/date.js"></script>
    <link rel="stylesheet" href="../assets/css/icon/css/all.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/index1.css">
    <title>EZ Check</title>
    </head>
    <%{%>
    <body>
    <% if(session.getAttribute("username")!=null){%>
    <ul class="nav">
    <a href="index.html" class="logo"><img src="../assets/images/logo.png" style="width:100px;"></a>
    <nav class="fun">
<!--網站瀏覽計數器--!>	
    <%
    sql = "SELECT * FROM count";
    ResultSet rs1 = con.createStatement().executeQuery(sql);
    rs1.next();
    int count = rs1.getInt(1);
	if(session.isNew())
	{
		count++;
		sql = "Update count Set count = '" + count + "'";
		con.createStatement().execute(sql);
	}
	%>
	
	<form action="signout.jsp" method="post">
    <button type="submit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" >登出</button>
	</form>
    <%if(session.getAttribute("username").equals("good")){%>		
<!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModa2" style="position:absolute;left:97%;top:1px"><a href="back.jsp" style="text-decoration:none; color: white;">後臺管理</a></button>
    <%}%>
<!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" style="position:absolute;left:235px;top:1px">預訂清單</button>
	<div style="position:absolute; width:120px;left:235px;top:3px">網站瀏覽人數：<%out.print(count);%></div>
	</nav>
    </ul>
 	<% } else{%>
    <ul class="nav">
    <a href="index.html" class="logo"><img src="../assets/images/logo.png" style="width:100px;"></a>
    <nav class="fun">
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">登入</button>
<!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Welcome to EZ check</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body">
    <br>
    <form action="check.jsp" method="post">
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">帳號：</label>
        <input type="textmodal" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="username">
    </div>
    <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">密碼：</label>
        <input type="password" class="form-control" id="exampleInputPassword1" name="password">
    </div>
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">還沒註冊</button>
        <button type="submit" class="btn btn-primary">確認</button>
    </div>
	</form>
    </div>
    </div>
    </div>

<!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModa2">加入我們</button>

<!-- Modal -->
    <div class="modal fade" id="exampleModa2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabe1">John  us !</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body">
    <form action="signin.jsp" method="post">
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">信箱：</label>
        <input type="email" class="form-control" id="exampleInputEmail1" required aria-describedby="emailHelp" name="email">
    </div>
    <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">姓名：</label>
        <input  type="text" class="form-control" id="exampleInputPassword1" required name="name">
    </div>
    <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">手機：</label>
        <input  type="tel" class="form-control" id="exampleInputPassword1" required name="phone">
    </div>
    <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">帳號：</label>
        <input  type="text" class="form-control" id="exampleInputPassword1" required name="username">
    </div>
    <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">密碼：</label>
        <input type="password" class="form-control" id="exampleInputPassword1" required name="password">
    </div>
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">密碼確認：</label>
        <input type="password" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required name="password2">
    </div>
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">地址：</label>
        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required name="address">
    </div>
    <button type="submit" class="btn btn-primary" style="position:relative; left:40%; top:-10px;">註冊</button>
    </div>
	</form>
    </div>
    </div>
    </div>
	
<!--網站瀏覽計數器--!>	
    <%
    sql = "SELECT * FROM count";
    ResultSet rs1 = con.createStatement().executeQuery(sql);
    rs1.next();
    int count = rs1.getInt(1);
	if(session.isNew())
	{
		count++;
		sql = "Update count Set count = '" + count + "'";
		con.createStatement().execute(sql);
	}
	%>
	
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary">預訂清單</button>
	<div style="position:absolute; width:120px;left:235px;top:3px">網站瀏覽人數：<%out.print(count);%></div>
	<div class="contain" onclick="myFunction1()">
    <div class="bar1"></div>
    <div class="bar2"></div>
    <div class="bar3"></div>
    </div>
    <div class="dropdown">
    <div id="myDropdown" class="dropdown-content">
    <a href="#search">搜尋地點</a>
    <a href="#quick">快速選單</a>
    <a href="#hot">熱門住宿</a>
    <a href="#about">關於我們</a>
    <a href="mailto:ezcheck111@gmail.com">聯繫我們</a>
    </div>
    </div>
    </nav>
    </ul>
   
	<%}%>
	<%}%>
	
    <br>
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
    <div class="carousel-item active">
        <a href="TP/TP-1.html" target="_blank"> <img src="../assets/images/ad1.png" class="d-block w-100" alt="..."></a>
    </div>
    <div class="carousel-item">
        <a href="Yilan/Yilan-1.html" target="_blank"><img src="../assets/images/ad2.png" class="d-block w-100" alt="..."></a>
    </div>
    <div class="carousel-item">
        <a href="HI/HI-4.html" target="_blank"><img src="../assets/images/ad3.png" class="d-block w-100" alt="..."></a>
    </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
    </div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    -->

    <a name="search">
    <div class="search">
    <form method="POST" action="">
    <div class="container">
        <span class="icon1"><i class="fa fa-search"></i></span>
        <input type="search" id="search" placeholder="你想去哪裡？">
    </div>

    <div class="date">
        <span class="icon2"><i class="far fa-calendar-alt"></i></span>
        <input type="date" id="cdate" placeholder="入住" class="show_text">
        <span class="icon2-1"><i class="far fa-calendar-alt"></i></span>
        <input type="date" id="cdate1" placeholder="退房" class="show_text">
    </div>

    <div class="people">
        <span class="icon3"><i class="fas fa-user"></i></span>
        <select size="1" class="choose">
            <option>1人</option>
            <option>2人</option>
            <option>3人</option>
            <option>4人</option>
        </select>
    <div class="submit">
        <button class="button">搜尋</button>
    </div>
    </div>
         
    </form>
    </div>
    </a>

    <a name="quick">
    <div class="text">快速選單</div>
    <a href="h_product2.html" target="_blank">
        <button class="quickbtn">基隆</button></a>
    <a href="h_product1.jsp" target="_blank">
        <button class="quickbtn">台北</button></a>
    <a href="h_product5.html" target="_blank">
        <button class="quickbtn">新北</button></a>
    <a href="h_product4.html" target="_blank">
        <button class="quickbtn">宜蘭</button></a>
    <a href="h_product6.html" target="_blank">
        <button class="quickbtn">桃園</button></a>
    <a href="h_product3.html" target="_blank">
        <button class="quickbtn">新竹</button></a>
    </a>
    <a name="hot">
    <div class="text">熱門住宿</div>
    <div class="city">
    <div class="p_text">台北 Taipei</div>
    <a href="tai_room.html">
        <img src="../assets/images/taipei.jpeg" class="photo"></a>
    <div class="p_text1">新北 Taipei</div>
        <img src="../assets/images/taipei2.jpeg" class="photo2">
    <div class="p_text2">基隆 Keelung</div>
        <img src="../assets/images/keelung.png" class="photo3">
    <div class="p_text3">桃園 Taoyuan</div>
        <img src="../assets/images/taoyuan.png" class="photo4">
    <div class="p_text4">新竹 Hsinchu</div>
        <img src="../assets/images/hsinchu.png" class="photo5">
    </div>

    <div class="footer">
    <div class="f_text">Copyright © 2021. All rights reserved.</div>
    </div>

     
    </body>
</html>
