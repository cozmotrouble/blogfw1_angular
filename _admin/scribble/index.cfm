
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>cf_jscalender test </title>
</head>

<body>

<cfform action="#Script_Name#" method="post" enctype="application/x-www-form-urlencoded">
<cfparam name="form.PlanDate" default="#DateFormat(Now(), "MM/DD/yyyy")#">
Date:
<cf_jscalender
	fieldname="PlanDate"
	errormessage="Please select a vaild Date."
	reqired="true"
	includefiles="true"
	size="12"
	jsDateFormat="%m/%d/%y"
	DateFormat="mm/dd/yy"
	value="#form.PlanDate#"
	showsTime="false"
	showbutton="true"
	class="datefield"
	jslocation="js/"
	csslocation="js/"
	>
&nbsp; &nbsp;
<input type="Submit" value="GO">
</cfform>
<br>


<cfoutput >
#form.PlanDate#
</cfoutput>

</body>
</html>
