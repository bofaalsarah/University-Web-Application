<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewAllAttendance.aspx.cs" Inherits="ViewAllAttendance" %>

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
      <h1><a href="studentHome.html"><img id="logoimg" src="images/logo.png" alt=""/></a></h1>
    </div>
    </center>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="breadcrumb">
    <ul id="bcul">
      
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="homecontent">
    <div class="fl_left">
      <div class="column2">
      <h2>View/Edit Attendance</h2>
          <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Course:"></asp:Label>
          <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="getDates" AutoPostBack="true"></asp:DropDownList><br /><br />
              <asp:Label ID="Label2" runat="server" Text="Date:"></asp:Label>
          <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="changeDates" AutoPostBack="true" dataTextFormatString="{0:dd/MM/yyyy}"></asp:DropDownList><br /><br />
              <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Button2_Click" /><br /><br />
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
                  SelectCommand="select Student.id, Student.username, Student.firstName, Student.lastName, Student_Attendance.attended from Student, Student_Attendance 
                  where Student_Attendance.studentId in (select studentId from Student_Attendance where courseId = @cid) and 
				  Student_Attendance.sessionDate = @sdate and Student.id = Student_Attendance.studentId">
                  <selectparameters>
                      <asp:Parameter name="sdate"/>
                    <asp:Parameter name="cid"/>
                </selectparameters>
              </asp:SqlDataSource>
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
              <Columns>
                  <asp:BoundField DataField="id" HeaderText="Id"></asp:BoundField>
                  <asp:BoundField DataField="username" HeaderText="Username"></asp:BoundField>
                  <asp:BoundField DataField="firstName" HeaderText="First Name"></asp:BoundField>
                  <asp:BoundField DataField="lastName" HeaderText="Last Name"></asp:BoundField>
                  
                  <asp:TemplateField HeaderText="Attended">
                      <ItemTemplate>
                          <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("attended") %>' />
                      </ItemTemplate>
                  </asp:TemplateField>
                  
              </Columns>
          </asp:GridView>
          <asp:Button ID="Button3" runat="server" Text="Edit Attendance" Visible="false" OnClick="Button3_Click"/>
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
                  <p class="imgholderuser"><asp:Image ID="Image1" style="height:180px;width:170px" runat="server" /></p>
              </center>
              <p><asp:Label ID="adminame" runat="server" Text="Label"></asp:Label></p>
              <p><br /></p>
              <p><asp:Label ID="adminno" runat="server" Text="Label"></asp:Label></p>
              <p><br /></p>
              <p><asp:Label ID="adminemail" runat="server" Text="Label"></asp:Label></p>
              <p><br /></p>
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
</body>
</html>