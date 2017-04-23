<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>School Education | Style Demo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="../layout/styles/layout.css" type="text/css" />
<script type="text/javascript" src="../layout/scripts/jquery.min.js"></script>
<script type="text/javascript" src="../layout/scripts/jquery.slidepanel.setup.js"></script>
</head>
<body>
<!-- ####################################################################################################### -->
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
      <h1><a href="Default.aspx"><img id="logoimg" src="images/logo.png" alt="" /></a></h1>
    </div>
    <div id="topnav">
      <ul>
        <li><a href="Default.aspx">HOME</a></li>
        <li><a href="courses.html">OUR COURSES</a></li>
        <li class="active"><a href="Feedback.aspx">FEEDBACK</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="container">
    <div id="content">
      <h2>Write A Comment</h2>
      <div id="respond">
          <form id="form1" runat="server">
          <p>

            <asp:TextBox ID="name" runat="server"></asp:TextBox>
            <label for="name"><small>Name (required)</small></label>
          </p>
          <p>
              <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <label for="email"><small>Mail (required)</small></label>
          </p>
          <p>
            <asp:TextBox ID="comment" runat="server" TextMode="MultiLine"></asp:TextBox>
            <label for="comment" style="display:none;"><small>Comment (required)</small></label>
          </p>
          <p>
              <asp:Button ID="Button1" runat="server" Text="Submit Form" OnClick="Button1_Click" />
            &nbsp;
            <input name="reset" type="reset" id="reset" tabindex="5" value="Reset Form" />
          </p>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is not in a proper format." ValidationExpression="(.+)@(.+)\.(.+)" ControlToValidate="email" CssClass="emailerror"></asp:RegularExpressionValidator><br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is a mandatory field." ControlToValidate="name" CssClass="emailerror"></asp:RequiredFieldValidator><br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email is a mandatory field." ControlToValidate="email" CssClass="emailerror"></asp:RequiredFieldValidator><br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Comment is a mandatory field." ControlToValidate="comment" CssClass="emailerror"></asp:RequiredFieldValidator><br />
        </form>
      </div>

      <div id="comments">
        <h2>Comments</h2>
        <ul class="commentlist">
          <li class="comment_odd">
            <div class="author"><img class="avatar" src="images/mohamad.jpg" width="32" height="32" alt="" /><span class="name">Mohamad Hatem</span> <span class="wrote">wrote:</span></div>
            <div class="submitdate"><a href="#">January 4, 2015 at 3:35 am</a></div>
            <p>APU is a fantastic University, I hope I had the chance to study there.</p>
          </li>
          <li class="comment_even">
            <div class="author"><img class="avatar" src="images/mustafaH.jpg" width="32" height="32" alt="" /><span class="name">Mustafa Hasan</span> <span class="wrote">wrote:</span></div>
            <div class="submitdate"><a href="#">October 21, 2012 at 8:35 am</a></div>
            <p>This university does not lack anything and the new building is very nice.</p>
          </li>
          <li class="comment_odd">
            <div class="author"><img class="avatar" src="images/mustafaA.jpg" width="32" height="32" alt="" /><span class="name">Mustafa Mabrook</span> <span class="wrote">wrote:</span></div>
            <div class="submitdate"><a href="#">September 27, 2009 at 8:35 am</a></div>
            <p>I like studying here, the lecturers are very nice and they speek English fluently.</p>
          </li>
        </ul>
      </div>
    </div>
    <div id="column">
      <div id="featured">
        <ul>
          <li>
            <h2>Careers At APU</h2>
            <p class="imgholder"><img src="images/career.jpg"style="height:90px;width:240px" alt="" /></p>
            <p>If you are looking for an innovative teaching environment and have the required communication and teaching skills, qualifications and knowledge, we welcome you to submit your application and stand the chance of joining our fast-growing, reputable university.
            <br/>Kindly submit your resume, providing full details of your education and working experience, present and expected salary, and a recent photograph to:
            <br/>The Sr. Manager, HR Development,<br/>APIIT Education Group,<br>Technology Park Malaysia,<br/>Bukit Jalil, 57000 Kuala Lumpur.</p>
          </li>
        </ul>
      </div>
      <div class="holder">
        <h2>Contact Us</h2>
        <p>Feel free to send Email to:</p>
        <ul>
          <li>info@apu.edu.my for general enquiries</li>
          <li>students@apu.edu.my for student services</li>
          <li>media@apu.edu.my for press media</li>
          <li>bursary@apu.edu.my for bursary</li>
        </ul>
      </div>
    </div>
    <div class="clear"></div>
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
    <p>Copyright &copy; 2017 Asia Pacific University of Technology & Innovation (APU). All rights reserved</p>
    <br class="clear" />
  </div>
 </center>
</div>
    <script>
        var loc = document.location.search.substr(1);
        if (loc == "received") {
            alert("Thanks for your feedback !! We will review it and contact you if there are any problems.")
        }
    </script>
</body>
</html>
