<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Teacher.aspx.cs" Inherits="Teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>APU | Student Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="../layout/styles/layout.css" type="text/css" />
<script type="text/javascript" src="../layout/scripts/jquery.min.js"></script>
<script type="text/javascript" src="../layout/scripts/jquery.slidepanel.setup.js"></script>
</head>
<body>
<!-- ####################################################################################################### -->
<div class="wrapper col1">
  <div id="header">
  <center>
    <div id="logo1">
      <h1><a href="Teacher.aspx"><img id="logoimg" src="images/logo.png" alt=""/></a></h1>
    </div>
    </center>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="homecontent">
    <div class="fl_left">
      <div class="column2">
      <h2>Services</h2>
        <ul>
          <li>
          <center>
            <div><img src="images/attendance.png" alt="" style="width:130px;height:130px;" /></div>
            <p><a href="TeacherMarkAttendance.aspx">Mark New Attendance</a></p>
            </center>
          </li>
          <li class="last">
          <center>
            <div><img src="images/editAttendance.png" alt=""  style="width:130px;height:130px;"/></div>
            <p><a href="TeacherEditAttendance.aspx">View/Edit Attendance</a></p>
            </center>
          </li>
          <li>
          <center>
            <div><img src="images/subject.png" alt="" style="width:130px;height:130px;" /></div>
            <p><a href="TeacherMaterial.aspx">Manage Students' Materials</a></p>
            </center>
          </li>
          <li class="last">
          <center>
            <div><img src="images/assignedCourses.png" alt="" style="width:130px;height:130px;" /></div>	
            <p><a href="TeacherCourses.aspx">View Assigned Courses</a></p>
            </center>
          </li>
        </ul>
        <br class="clear" />
      </div>
    </div>
    </div>
    </div>
<!-- ####################################################################################################### -->
    <div id="column1">
      <div id="featured1">
        <ul>
          <li>
          <center>
            <h2>Profile Information</h2>
			<p class="imgholderuser"><asp:Image ID="Image1" style="height:180px;width:170px" runat="server"></asp:Image></p>
			</center>
            <p><asp:Label ID="teachername" runat="server" Text="Label"></asp:Label></p>
            <p><br/></p>
            <p><asp:Label ID="teacherno" runat="server" Text="Label"></asp:Label></p>
            <p><br/></p>
            <p><asp:Label ID="teacheremail" runat="server" Text="Label"></asp:Label></p>
            <p><br/></p>
            <center><a href="ChangePassword.aspx" style="color:#631C23;">Change Password</a></center><br />
             <form id="form1" runat="server">
            <center><asp:Button ID="Button1" runat="server" Text="LOGOUT" style="color:#631C23" OnClick="Button1_Click"></asp:Button></center>
            </form>
          </li>
        </ul>
      </div>
    </div>
    <div class="clear"></div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="footer">
    <div class="footbox">
      <h2>About Us</h2>
      <ul>
        <li>APU - Malaysia's Award-Winning University</li>
        <li>Professional Careers Start Here!</li>
        <li class="last">Over 95% Graduates Employed by Graduation [2016]</li>
      </ul>
    </div>
    <div id="invisible" class="footbox">
      <h2>Lacus interdum</h2>
      <ul>
        <li>Asia Pacific University of Technology & Innovation (APU</li>
        <li>Technology Park Malaysia</li>
        <li>Bukit Jalil, Kuala Lumpur 57000</li>
        <li>Malaysia</li>
        <li>JPT/BPP(U)1000-801/63/Jld.3(18)</li>
      </ul>
    </div>
    <div class="footbox">
      <h2>Our Office</h2>
      <ul>
        <li>Asia Pacific University of Technology & Innovation (APU</li>
        <li>Technology Park Malaysia</li>
        <li>Bukit Jalil, Kuala Lumpur 57000</li>
        <li>Malaysia</li>
        <li class="last">JPT/BPP(U)1000-801/63/Jld.3(18)</li>
      </ul>
    </div>
    <div id="invisible" class="footbox">
      <h2>Lacus interdum</h2>
      <ul>
        <li><a href="#">Lorem ipsum dolor</a></li>
        <li><a href="#">Suspendisse in neque</a></li>
        <li><a href="#">Praesent et eros</a></li>
        <li><a href="#">Lorem ipsum dolor</a></li>
        <li><a href="#">Suspendisse in neque</a></li>
        <li class="last"><a href="#">Praesent et eros</a></li>
      </ul>
    </div>
    <div class="footbox last">
      <h2>Contact us</h2>
      <ul>
        <li>Tel: +603 8996 1000</li>
        <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1 300 888 278</li>
        <li>Fax: +603 8996 1001</li>
        <li >Email: info@apu.edu.my</li>
        <li class="last"><a href="feedback.html">Leave Feedback</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col5">
<center>
  <div id="copyright">
    <p>Copyright &copy; 2017 Asia Pacific University of Technology & Innovation (APU). All rights reserved</p>
    <br class="clear" />
  </div>
 </center>
</div>
<script>
        var loc = document.location.search.substr(1);
        var type = loc.split("=")[0];
        var val = loc.split("=")[1];
        var message = "";
        if (type == "error") {
            if (val == "1")
                message = "Attendance was already marked for this course for today."
        }
        if (type == "success") {
            if (val == "1")
                message = "Attendance was marked successfully."
            if (val == "2")
                message = "Attendance was edited successfully."
            if (val == "3")
                message = "Course material was uploaded successfully."
            if (val == "4")
                message = "Password was changed successfully."
        }
        if(message.length > 0)
            alert(message);
</script>
</body>
</html>
