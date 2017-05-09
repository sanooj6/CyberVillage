<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <jsp:include page="Header.jsp"></jsp:include>
    <!-- Start Page Banner -->
    <div class="page-banner" style="padding:40px 0; background: url(images/slide-02-bg.jpg) center #f9f9f9;">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h2>Contact Us</h2>
            <p>We Are Professional</p>
          </div>
          <div class="col-md-6">
            <ul class="breadcrumbs">
              <li><a href="Home.jsp">Home</a></li>
              <li>Contact Us</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- End Page Banner -->
 <!-- Start Map -->
    <div id="map" style="text-align: center; overflow: hidden; margin-top:20px;">
    	<img alt="Map" src="images/map.jpeg">
    </div>

    <!-- End Map -->

    <!-- Start Content -->
    <div id="content">
      <div class="container">

        <div class="row">

          <div class="col-md-8">

            <!-- Classic Heading -->
            <h4 class="classic-title"><span>Contact Us</span></h4>

            <!-- Start Contact Form -->
            <form class="contact-form" id="contact-form">
              <div class="form-group">
                <div class="controls">
                  <input type="text" placeholder="Name" name="name" id="name" class="validate[required, minSize[3]]">
                </div>
              </div>
              <div class="form-group">
                <div class="controls">
                  <input type="text" class="validate[required,custom[email]]" placeholder="Email" name="email" id="email">
                </div>
              </div>
              <div class="form-group">
                <div class="controls">
                  <input type="text" class="validate[required, minSize[3]]" placeholder="Subject" name="subject" id="subject">
                </div>
              </div>

              <div class="form-group">

                <div class="controls">
                  <textarea rows="7" placeholder="Message" name="message" id="message" class="validate[required, minSize[5]]"></textarea>
                </div>
              </div>
              <input type="submit" id="op" class="btn-system btn-large" value="Send" name="op">
            </form>
            <!-- End Contact Form -->

          </div>

          <div class="col-md-4">

            <!-- Classic Heading -->
            <h4 class="classic-title"><span>Information</span></h4>

            <!-- Some Info -->
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum.</p>

            <!-- Divider -->
            <div class="hr1" style="margin-bottom:10px;"></div>

            <!-- Info - Icons List -->
            <ul class="icons-list">
              <li><i class="fa fa-globe">  </i> <strong>Address:</strong> 1234 Street Name, Bangladesh.</li>
              <li><i class="fa fa-envelope-o"></i> <strong>Email:</strong> info@yourcompany.com</li>
              <li><i class="fa fa-mobile"></i> <strong>Phone:</strong> +12 345 678 001</li>
            </ul>

            <!-- Divider -->
            <div class="hr1" style="margin-bottom:15px;"></div>

            <!-- Classic Heading -->
            <h4 class="classic-title"><span>Working Hours</span></h4>

            <!-- Info - List -->
            <ul class="list-unstyled">
              <li><strong>Monday - Friday</strong> - 9am to 5pm</li>
              <li><strong>Saturday</strong> - 9am to 2pm</li>
              <li><strong>Sunday</strong> - Closed</li>
            </ul>

          </div>

        </div>

      </div>
    </div>
    
 <script type="text/javascript">
 $('#Cmenu').addClass('active');
</script>
   <jsp:include page="Footer.jsp"></jsp:include>