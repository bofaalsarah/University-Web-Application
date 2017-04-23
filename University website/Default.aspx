<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Asia Pacific University</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.slidepanel.setup.js"></script>
<!-- Homepage Only Scripts -->
<script type="text/javascript" src="layout/scripts/jquery.cycle.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('#featured_slide').after('<div id="fsn"><ul id="fs_pagination">').cycle({
            timeout: 5000,
            fx: 'fade',
            pager: '#fs_pagination',
            pause: 1,
            pauseOnPagerHover: 0
        });
    });
</script>
<!-- End Homepage Only Scripts -->
</head>
<body>
<div class="wrapper col0">
  <div id="topbar">
    <div id="slidepanel">
      <div class="topbox">
        <h2>Welcome ^_^</h2>
        <p>Welcome to The University of Asia Pacific University (APU).<br>Alongside our UK and China campuses, we are proud to consider ourselves a truly international university.</p>
      </div>
      <div class="topbox">
        <h2>Reset Password</h2>
        <form id="form1" runat="server">
          <fieldset>
            <legend>Reset Password</legend>
            <label for="resetteacher">Teacher Username:
                <asp:TextBox id="resetteacher"  runat="server"></asp:TextBox>
            </label>
             <label for="resetstudent">Student Username:
                <asp:TextBox id="resetstudent"  runat="server"></asp:TextBox>
            </label>
            <p>
                <asp:Button ID="Button1" runat="server" Text="Reset Password" OnClick="Button2_Click" />
            </p>
          </fieldset>
      </div>
      <div class="topbox last">
        <h2>Login</h2>
          <fieldset>
            <legend>Login</legend>
            <label for="username">Username:
                <asp:TextBox id="username"  runat="server"></asp:TextBox>
            </label>
            <label for="password">Password:
                <asp:TextBox id="password"  runat="server" TextMode="Password"></asp:TextBox>
            </label>
              <asp:Label ID="Label1" runat="server" Text="Login as: "></asp:Label>
              <asp:DropDownList ID="userType" runat="server">
                  <asp:ListItem Selected="True">Teacher</asp:ListItem>
                  <asp:ListItem>Student</asp:ListItem>
                  <asp:ListItem>Admin</asp:ListItem>
              </asp:DropDownList>
            <p>
                <br />
              <asp:Button ID="Button2" runat="server" Text="Login" OnClick="Button1_Click" />
            </p>
          </fieldset>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Teacher]"></asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Admin]"></asp:SqlDataSource>
        </form>
      </div>
      <br class="clear" />
    </div>
    <div id="loginpanel">
      <ul>
        <li class="left">To Log In &raquo;</li>
        <li class="right" id="toggle"><a id="slideit" href="#slidepanel">Click here</a><a id="closeit" style="display: none;" href="#slidepanel">Close Panel</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
      <h1><a href="index.html"><img id="logoimg" src="images/logo.png"></a></h1>
    </div>
    <div id="topnav">
      <ul>
        <li class="active"><a href="Default.aspx">HOME</a></li>
        <li><a href="courses.html">OUR COURSES</a></li>
        <li><a href="Feedback.aspx">FEEDBACK</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="featured_slide">
    <div class="featured_box"><a href="#"><img src="images/banner.jpg" alt="" /></a>
    </div>
    <div class="featured_box"><a href="#"><img src="images/banner2.png" alt="" /></a>
    </div>
    <div class="featured_box"><a href="#"><img src="images/banner3.jpg" alt="" /></a>
    </div>
    <div class="featured_box"><a href="#"><img src="images/banner4.png" alt="" /></a>
    </div>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="homecontent">
    <div class="fl_left">
      <div class="column2">
      <h2>Spotlight</h2>
        <ul>
          <li>
          <center>
            <div class="imgholder"><img src="images/spotlight1.jpg" alt="" /></div>
            <a href="https://www.youtube.com/watch?v=zCaYJRKEyXk">APU RELIVE 2015</a>
            </center>
          </li>
          <li class="last">
          <center>
            <div class="imgholder"><img src="images/spotlight2.jpg" alt="" /></div>
            <a href="https://www.youtube.com/watch?v=a9g1mthXuXA">Life @ APU - An Interview with Kazakhstan Students</a>
            </center>
          </li>
          <li>
          <center>
            <div class="imgholder"><img src="images/spotlight3.jpg" alt="" /></div>
            <a href="https://www.youtube.com/watch?v=JqCSp8ewmwY">Interview with Rowena Beighton-Dykes</a>
            </center>
          </li>
          <li class="last">
          <center>
            <div class="imgholder"><img src="images/spotlight4.jpg" alt="" /></div>	
            <a href="https://www.youtube.com/watch?v=GDL_kaHQ6nA">Mauritius Independence Day at UCTI, Malaysia</a>
            </center>
          </li>
          <li>
          <center>
            <div class="imgholder"><img src="images/spotlight5.jpg" alt="" /></div>
            <a href="https://www.youtube.com/watch?v=sxpJOl2k2ws">Asia Pacific Robotics Competition (APROC) 2014</a>
            </center>
          </li>
          <li class="last">
          <center>
            <div class="imgholder"><img src="images/spotlight6.jpg" alt="" /></div>
            <a href="https://www.youtube.com/watch?v=-mu4s8lMkX0">APU Graduation Ceremony - June 2013!</a>
            </center>
          </li>
        </ul>
        <br class="clear" />
      </div>
    </div>
    <div class="fl_right">
      <h2>Latest Events</h2>
      <ul>
        <li>
          <div class="imgholder"><img class="eventimg" src="images/eventimg1.jpg" alt="" /></div>
          <p>Apart from learning academic knowledge in classrooms, our Tourism Management students also conducted an industrial visit to Royal Selangor, in order to gain practical experience and knowledge in the real-world tourism industry, under the coordination of Mr. Pathmanaban and Ms. Fiona from the APU School of Marketing & Media (SOMM).</p>
        </li>
        <li>
          <div class="imgholder"><img class="eventimg" src="images/eventimg2.jpg" alt="" /></div>
          <p>We are pleased so share that 3 teams from APU attained all of the top 3 awards, as they emerged as the Champion, 1st Runner-Up and 2nd Runner Up award winners of the Academic Track of Big App Challenge 3.0, that was organized by the Malaysia Digital Economy Corporation (MDEC).</p>
        </li>
        <li>
          <div class="imgholder"><img class="eventimg" src="images/eventimg3.png" alt="" /></div>
          <p>Despite being new comer in the new format of the game, huge pressure on the team and stiff competition from other colleges & universities, the APU Cricket team secured a 2nd runner-up position at the Malaysian Cricket Association (Cricket Governing Body in Malaysia) - First Ever Indoor Cricket Championship 2016, held at Bayuemas Oval Indoor Cricket Stadium Sports complex in Klang, from Sunday, 27 November to Monday, 28 November 2016.</p>
        </li>
        <li>
          <div class="imgholder"><img class="eventimg" src="images/eventimg4.jpg" alt="" /></div>
          <p>In light with this view, the Academic Research Skills (ARS) module team from School of Foundation (SoF) initiated an excursion to the FRIM, Kepong. FRIM sits on a 545-ha site which is one of the leading institutions in tropical forestry research in the world.</p>
        </li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
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
    <p>Copyright &copy; 2017 Asia Pacific University of Technology & Innovation (APU). All rights reserved.</p>
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
            if (val == "1") {
                message = "Invalid username/password/user type combination."
            }
            if (val == "2") {
                message = "Please supply a single value to reset the password for."
            }
        }
        if (type == "reset") {
            if (val == "1") {
                message = "Password reset was successful if the supplied username/user type combination exists in our database."
            }
        }
        if(message.length > 0)
            alert(message);
    </script>
</body>
</html>