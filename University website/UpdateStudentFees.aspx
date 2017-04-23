<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateStudentFees.aspx.cs" Inherits="AddUser" %>

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
      <h2>Manage Student Fees</h2>
          <form id="form1" runat="server">
              <div style="display:inline-block;">
                  <br /><br />
                  <asp:Label ID="Label1" runat="server" Text="Enter a username here:" style="font-weight: 700"></asp:Label>          
                  <asp:TextBox ID="username" runat="server" CssClass="formright" ></asp:TextBox>                
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:Button ID="Button4" runat="server" Text="Search" OnClick="Button4_Click"  />
                  <hr /><br />
                  <asp:Label ID="Label6" runat="server" Text="Student First Name: " style="font-weight: 700"></asp:Label>
                  <asp:TextBox ID="firstname" runat="server" CssClass="formright" ReadOnly="True"></asp:TextBox><br /><br />
                  <asp:Label ID="Label7" runat="server" Text="Student Last Name: " style="font-weight: 700"></asp:Label>
                  <asp:TextBox ID="lastname" runat="server" CssClass="formright" ReadOnly="True"></asp:TextBox><br /><br />
                  <asp:Label ID="Label3" runat="server" Text="Total Fees: " style="font-weight: 700"></asp:Label>
                  <asp:TextBox ID="total" runat="server" CssClass="formright" ReadOnly="True"></asp:TextBox><br /><br />
                  <asp:Label ID="Label4" runat="server" Text="Outstanding Fees: " style="font-weight: 700"></asp:Label>
                  <asp:TextBox ID="outstanding" runat="server" CssClass="formright" ReadOnly="True"></asp:TextBox><br /><br />
                  <asp:Label ID="Label5" runat="server" Text="Amount Paid: " style="font-weight: 700"></asp:Label>
                  <asp:TextBox ID="paid" runat="server" CssClass="formright" ReadOnly="True"></asp:TextBox><br /><br />
                  <hr /><br />
                  <asp:Label ID="Label2" runat="server" Text="Enter the amount to be paid: " style="font-weight: 700"></asp:Label>
                  <asp:TextBox ID="topay" runat="server" CssClass="formright"></asp:TextBox><br /><asp:regularexpressionvalidator id="RequiredFieldValidator" runat="server" errormessage="Amount must be an integer greater than 0" controltovalidate="topay" CssClass="emailerror" validationexpression="[1-9][0-9]*$"  setfocusonerror="true" ValidationGroup="update"></asp:regularexpressionvalidator> <br /><br />
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:Button ID="Button2" runat="server" Text="Update Fees" OnClick="Button2_Click" ValidationGroup="update"/>
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