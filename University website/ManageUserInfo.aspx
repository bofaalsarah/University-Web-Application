<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageUserInfo.aspx.cs" Inherits="AddUser" %>

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
    <ul>
      <li>&nbsp;&nbsp;&nbsp;Go To&nbsp;&#187;&nbsp;&nbsp;</li>
      <li><a href="#">Link 2</a></li>
      <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
      <li><a href="#">Link 3</a></li>
      <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
      <li><a href="#">Link 4</a></li>
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="homecontent">
    <div class="fl_left">
      <div class="column2">
      <h2>Manage Teacher/Student</h2>
          <form id="form1" runat="server">
              <div style="display:inline-block;">
                  <asp:Label ID="Label9" runat="server" Text="User Type:" style="font-weight: 700"></asp:Label>
                  <asp:DropDownList ID="DropDownList1" runat="server">
                      <asp:ListItem Selected="True">Teacher</asp:ListItem>
                      <asp:ListItem>Student</asp:ListItem>
                  </asp:DropDownList><br /><br />
                  <asp:Label ID="Label1" runat="server" Text="Enter a username here:" style="font-weight: 700"></asp:Label>          
                  <asp:TextBox ID="username" runat="server" CssClass="formright" ValidationGroup="x"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username field is mandatory." ControlToValidate="username" CssClass="emailerror"></asp:RequiredFieldValidator> <br /><br />                  
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:Button ID="Button4" runat="server" Text="Search" OnClick="Button4_Click" ValidationGroup="x" />
                  <hr /><br />
                  <asp:Label ID="Label3" runat="server" Text="First Name:" style="font-weight: 700"></asp:Label>
                  <asp:TextBox ID="firstname" runat="server" CssClass="formright"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="First Name field is mandatory." ControlToValidate="firstname" CssClass="emailerror" ValidationGroup="addForm"></asp:RequiredFieldValidator><br /><br />
                  <asp:Label ID="Label4" runat="server" Text="Last Name:" style="font-weight: 700"></asp:Label>
                  <asp:TextBox ID="lastname" runat="server" CssClass="formright"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Last Name field is mandatory." ControlToValidate="lastname" CssClass="emailerror" ValidationGroup="addForm"></asp:RequiredFieldValidator><br /><br />
                  <asp:Label ID="Label5" runat="server" Text="Passport #:" style="font-weight: 700"></asp:Label>
                  <asp:TextBox ID="passportno" runat="server" CssClass="formright"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Passport # field is mandatory." ControlToValidate="passportno" CssClass="emailerror" ValidationGroup="addForm"></asp:RequiredFieldValidator><br /><br />
                  <asp:Label ID="Label6" runat="server" Text="Country:" style="font-weight: 700"></asp:Label>
                  <asp:TextBox ID="country" runat="server" CssClass="formright" ReadOnly="True"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Country field is mandatory." ControlToValidate="country" CssClass="emailerror" ValidationGroup="addForm"></asp:RequiredFieldValidator><br /><br />
                  <asp:Label ID="Label7" runat="server" Text="Email:" style="font-weight: 700"></asp:Label>
                  <asp:TextBox ID="email" runat="server" CssClass="formright"></asp:TextBox><br /><br />
                  <asp:Label ID="Label8" runat="server" Text="Contact #:" style="font-weight: 700"></asp:Label>
                  <asp:TextBox ID="contactno" runat="server" CssClass="formright"></asp:TextBox><br /><br />
                  <asp:Button ID="Button2" runat="server" Text="Update details" OnClick="Button2_Click" />
              &nbsp;&nbsp;
                  <asp:Button ID="Button3" runat="server" Text="Delete user" OnClick="Button3_Click" />
              </div>
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
			<p class="imgholderuser"><img src="images/my.jpg"style="height:180px;width:170px" alt="" /></p>
			</center>
            <p><asp:Label ID="adminname" runat="server" Text="Label"></asp:Label></p>
            <p><br/></p>
            <p><asp:Label ID="adminno" runat="server" Text="Label"></asp:Label></p>
            <p><br/></p>
            <p><asp:Label ID="adminemail" runat="server" Text="Label"></asp:Label></p>
            <p><br/></p>
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