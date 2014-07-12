cf_jscalendar

CopyRight 2008 - Gerald Guido
Gerald@myinternetisbroken.com
http://www.myinternetisbroken.com

A ColdFusion port of the original DHTML Calendar by Mihai Bazon <mihai_bazon@yahoo.com>
http://dynarch.com/mishoo/

-------------------
  This program is free software published under the
  terms of the GNU Lesser General Public License.
  For the entire license text please refer to
  http://www.gnu.org/licenses/lgpl.html
-------------------

IMPORTANT:
Please refer to the jscalender documentation under js/doc/ or at 
http://www.dynarch.com/demos/jscalendar/doc/html/reference.html
OR 
http://www.dynarch.com/projects/calendar/
BEFORE emailing me. I offer no support for this but I will try to answer questions related 
to bugs or other issues providing I have the time to do so.

================================================================================

Title:      	jscalender.cfm
Author:     	Gerald Guido
Email:      	Gerald@mynternetisbroken.com
Website:    	http://myinternetisbroken.com
Purpose:    	Creates a calender widget using calendar.js
Requirements: 	A CFML Runtime. Tested on Adobe CF 7 & 8 and Railo 3.0 but should 
				run on any CFML Runtime that supports Custom tags and cfform including 
				Adobe CF 5+, and recent  versions of (Open) BlueDragon.

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
Jguido		07/11/2008		Created

------------------------------------------------------------------------------->


Notes:

Please refer to the jscalender documentation under js/doc/ BEFORE emailing me. I offer no support 
for this but I will answer questions related to bugs or other issues provided I have the time to do so.

If you have Multiple Instances of cf_jscalender set the first one to:
includefiles="true" 
(or nothing it defaults to true) and the later ones to:
includefiles="false"

You only need to include the JS and CSS files once. I have had problems with
including the JS and CSS files multiple times.

CF_jscalender defaults to using CFform for date validation and if it is required. 
If you set the useCFForm attribute to "false" you will need to roll your own form validation.



Contents
---------
index.cfm
jscalender.cfm
readme.txt
	js/
		  calendar.js     -- the main program file
		  lang/*.js       -- internalization files
		  *.css           -- color themes
		  cal.html        -- example usage file
		  doc/            -- documentation, in PDF and HTML
		  simple-1.html   -- quick setup examples [popup calendars]
		  simple-2.html   -- quick setup example for flat calendar
		  calendar.php    -- PHP wrapper
		  test.php        -- test file for the PHP wrapper

---------

===============================================================================

-------------------
The DHTML Calendar
-------------------

  Author: Mihai Bazon, <mihai_bazon@yahoo.com>
          http://dynarch.com/mishoo/

  This program is free software published under the
  terms of the GNU Lesser General Public License.

  For the entire license text please refer to
  http://www.gnu.org/licenses/lgpl.html

Contents
---------

  calendar.js     -- the main program file
  lang/*.js       -- internalization files
  *.css           -- color themes
  cal.html        -- example usage file
  doc/            -- documentation, in PDF and HTML
  simple-1.html   -- quick setup examples [popup calendars]
  simple-2.html   -- quick setup example for flat calendar
  calendar.php    -- PHP wrapper
  test.php        -- test file for the PHP wrapper

Homepage
---------

  For details and latest versions please refer to calendar
  homepage, located on my website:

    http://dynarch.com/mishoo/calendar.epl


