<!DOCTYPE html>
<html lang="en" ng-app="myApp">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><cfoutput>#rc.title#</cfoutput></title>
    <script src="//cdn.jsdelivr.net/jquery/1.11.1/jquery.min.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.19/angular.min.js"></script>
    <script src="js/angular/angular-route.min.js"></script>
  	<script src="js/controllers.js"></script>
  	 <script src="js/ng-table.js"></script>
  	
  	<script src="js/app.js"></script>
  	<script src="js/blog.js"></script>
  	
 
	<link rel="stylesheet" href="//cdn.jsdelivr.net/bootstrap/3.2.0/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="//cdn.jsdelivr.net/bootstrap/3.2.0/css/bootstrap.min.css">
    <!-- Custom styles for this template -->
      <link rel="stylesheet" href="css/ng-table.css">  	
    <link href="css/theme.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <style>
    body {
        margin-top: 20px;
    }
    .content, .page-header {
        margin-top: 40px;
    }
    /*     .page-header h1 {
        top:  120px;
        height:100px;
     
    	border:solid 1px black;
    }*/
    </style>

</head>

<body>

 
      <div class="navbar navbar-default   navbar-fixed-top">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
           <cfoutput> <a class="navbar-brand" href="/blogfw1_angular/##/list">Blog posts</a></cfoutput>
          </div>
          <div class="navbar-collapse collapse">
   <!---         <ul class="nav navbar-nav">
              <li class="active"><a href="http://getbootstrap.com/examples/theme/#">Home</a></li>
              <li><a href="http://getbootstrap.com/examples/theme/#about">About</a></li>
              <li><a href="http://getbootstrap.com/examples/theme/#contact">Contact</a></li>
              <li class="dropdown">
                <a href="http://getbootstrap.com/examples/theme/#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="http://getbootstrap.com/examples/theme/#">Action</a></li>
                  <li><a href="http://getbootstrap.com/examples/theme/#">Another action</a></li>
                  <li><a href="http://getbootstrap.com/examples/theme/#">Something else here</a></li>
                  <li class="divider"></li>
                  <li class="dropdown-header">Nav header</li>
                  <li><a href="http://getbootstrap.com/examples/theme/#">Separated link</a></li>
                  <li><a href="http://getbootstrap.com/examples/theme/#">One more separated link</a></li>
                </ul>
              </li>
            </ul>--->
          </div><!--/.nav-collapse -->
        </div>
      </div>

    <div class="container content">
		 <!--- body is result of views --->
		<cfoutput>#body#</cfoutput>	
  </div>
    <!-- /.container -->
    <!-- JavaScript -->

</body>
</html>