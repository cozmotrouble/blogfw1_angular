<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
<cfparam name="form.DATEExpireDate" default="#Now()#">
 

<cfform action="#Script_Name#" method="POST">
<cfoutput>

	<input type="hidden" name="Action" value="content_edited">
</cfoutput>
		
		Expiration Date:
		
    		 <cf_jscalender
				fieldname="DATEExpireDate"
				errormessage="Please select a vaild Date."
				reqired="false"
				size="20"
				jslocation="js/"
				csslocation="js/"
				DateFormat="ddd, mm/dd/yy"
				value="#form.DATEExpireDate#"
				jsDateFormat="%B %e, %Y"
				showbutton="true"
				useCFForm="true"  >

				<input type="Submit" value="Submit">
</cfform>




 


</body>
</html>
