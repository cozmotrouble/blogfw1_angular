<!DOCTYPE html>
<cfsetting showdebugoutput="true" >
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="/ApptacularBlogFW1/css/bootstrap.min.css"/>
		<script language="javascript" src="/ApptacularBlogFW1/js/bootstrap.min.js"></script>

		<meta charset="ISO-8859-1">
		<title>
			Apptacular Blog with FW1
		</title>
	</head>
	<body>
		
    	<cfparam name="count" default="1" type="integer">
    
	<p class="breadcrumb">
    	<cfoutput>
    	
    		<cfset sections = "Author,Post,Comment,Tag">
    		<cfloop list="#sections#" index="go">
    			<a href="#buildURL( action = "#go#")#">#go#</a>	<cfif listlen(sections) NEQ count> | </cfif>
    			<cfset count ++> 
    		</cfloop>
    	</cfoutput>
	</p>
		
		<cfoutput>#body#</cfoutput>
	</body>
</html>