<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeacherMaterial.aspx.cs" Inherits="TeacherMaterial" %>

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
      <form id="form1" runat="server">
          <asp:Label ID="Label1" runat="server" Text="Course:"></asp:Label>
          <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="changeValues" AutoPostBack="true"></asp:DropDownList><br /><br />
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="select * from Material where courseId = @cid">
                <selectparameters>
                    <asp:Parameter name="cid"/>
                </selectparameters>
            </asp:SqlDataSource>
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
              <Columns>
                  <asp:BoundField DataField="fileName" HeaderText="File Name"></asp:BoundField>
                  <asp:TemplateField HeaderText="Download">
                      <ItemTemplate>
                          <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="LinkButton1_Click">Download</asp:LinkButton>
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>
          </asp:GridView>
          <asp:Label ID="Label2" runat="server" Text="Upload File:"></asp:Label>
          <asp:FileUpload ID="FileUpload1" runat="server" /><br /><br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select a file to upload." ControlToValidate="FileUpload1" CssClass="emailerror" ValidationGroup="upload"></asp:RequiredFieldValidator><br />
          <asp:Button ID="Button2" runat="server" Text="Upload" OnClick="Button2_Click" ValidationGroup="upload"/>
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
              <p><asp:Label ID="teachername" runat="server" Text="Label"></asp:Label></p>
              <p><br /></p>
              <p><asp:Label ID="teacherno" runat="server" Text="Label"></asp:Label></p>
              <p><br /></p>
              <p><asp:Label ID="teacheremail" runat="server" Text="Label"></asp:Label></p>
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
<script>
    var ul = document.getElementById("bcul");
    var links = ["<a href='Teacher.aspx'>Teacher Home</a>", "<a href='TeacherMarkAttendance.aspx'>Mark New Attendance</a>", "<a href='TeacherEditAttendance.aspx'>View/Edit Attendance</a>", "<a href='TeacherMaterial.aspx'>Manage Students' Materials</a>", "<a href='TeacherCourses.aspx'>View Assigned Courses</a>"];
    var li = document.createElement("li");
    li.innerHTML = "&nbsp;&nbsp;&nbsp;Go To&nbsp;&#187;&nbsp;&nbsp;";
    ul.appendChild(li);
    for (var i = 0; i < links.length; i++) {
        li = document.createElement("li");
        li.innerHTML = links[i];
        ul.appendChild(li);
        if (i != links.length - 1) {
            li = document.createElement("li");
            li.innerHTML = "&nbsp;&nbsp;|&nbsp;&nbsp;";
            ul.appendChild(li);
        }
    }
</script>
</body>
</html>
