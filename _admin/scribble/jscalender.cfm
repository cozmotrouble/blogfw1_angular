<cfsilent><cfparam name="attributes.jslocation" default="/js/">
<cfparam name="attributes.csslocation" default="/js/">
<cfparam name="attributes.fieldname" default="Mydate">
<cfparam name="attributes.errormessage" default="Please select a vaild Date.">
<cfparam name="attributes.includefiles" default="true">
<cfparam name="attributes.reqired" default="false">
<cfparam name="attributes.size" default="20">
<cfparam name="attributes.DateFormat" default="ddd, mm/dd/yy">
<cfparam name="attributes.value" default="#Now()#">
<cfparam name="attributes.timeFormat" default="12">
<cfparam name="attributes.jsDateFormat" default="%m/%d/%y">
<cfparam name="attributes.showsTime" default="false">
<cfparam name="attributes.showbutton" default="false">
<cfparam name="attributes.class" default="#attributes.fieldname#">
<cfparam name="attributes.useCFForm" default="true">
<!--- Document Information -----------------------------------------------------

Title:      jscalender.cfm
Author:     Gerald Guido
Email:      Gerald@mynternetisbroken.com
Website:    http://myinternetisbroken.com
Purpose:    Creates a calender widget using calendar.js

Usage:
<cf_jscalender
	fieldname="Mydate"
	errormessage="Please select a vaild Date."
	reqired="true/false"
	jslocation="/path/to/js/dir/"
	csslocation="/path/to/css/dir/"
	includefiles="true/false"
	size="20"
	DateFormat="ddd, mm/dd/yy"
	value="#Now()#"
	timeFormat="12"
	jsDateFormat="%a %m/%d/%y"
	showsTime="true/false"
	showbutton="true/false"
	class="CSS class"
			>

Modification Log:

Name			Date			Description
================================================================================
Gerald		07/11/2008		Created

------------------------------------------------------------------------------->

</cfsilent>
<cfif attributes.includefiles EQ "true">
	<cfoutput>
		 <!-- calendar stylesheet -->
		 <link rel="stylesheet" type="text/css" media="all" href="#attributes.csslocation#calendar-win2k-cold-1.css" title="win2k-cold-1" />
		 <!-- main calendar program -->
		 <script type="text/javascript" src="#attributes.jslocation#calendar.js"></script>
		 <!-- language for the calendar -->
		 <script type="text/javascript" src="#attributes.jslocation#lang/calendar-en.js"></script>
		 <!--  Calendar.setup helper function,  -->
		 <script type="text/javascript" src="#attributes.jslocation#calendar-setup.js"></script>
	</cfoutput>
</cfif>

<cfif attributes.useCFForm EQ "true">

 	<cfinput type="text"
			name="#attributes.fieldname#"
			id="#attributes.fieldname#"
			Size="#attributes.size#"
			required="#attributes.reqired#"
			value="#DateFormat(attributes.value ,'#attributes.DateFormat#')#"
			message="#attributes.errormessage#"
			 class="#attributes.class#">
<cfelse>
	<cfoutput>
	 	<input type="text"
				name="#attributes.fieldname#"
				id="#attributes.fieldname#"
				Size="#attributes.size#"
				value="#DateFormat(attributes.value ,'#attributes.DateFormat#')#"
				class="#attributes.class#">

	</cfoutput>
</cfif>
<cfoutput>
	<cfif attributes.showbutton EQ "true">
		<img src="#attributes.jslocation#img.gif" id="#attributes.fieldname#button" style="border: 1px solid white; cursor: pointer;" title="Date selector" onmouseover="this.style.border='1px solid red';" onmouseout="this.style.border=''">
	</cfif>
	<script type="text/javascript">
	     Calendar.setup({
	        inputField     :    "#attributes.fieldname#",      // id of the input field
	        ifFormat       :    "#attributes.jsDateFormat#",       // format of the input field
			<cfif attributes.showbutton EQ "true">
	        button         :    "#attributes.fieldname#button",  // trigger for the calendar (button ID)
			</cfif>
	        showsTime      :    #attributes.showsTime#,            // will display a time selector
   			timeFormat     :    "#attributes.timeFormat#",
	        singleClick    :    false,           // double-click mode
	        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
	        //dateStatusFunc :    function (date) { return (date.getDay() == 6 || date.getDay() == 0) ? true : false;}
	    });
	    // disable weekend days (Saturdays == 6 and Subdays == 0)
	</script>
</cfoutput>