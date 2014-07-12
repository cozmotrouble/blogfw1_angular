<!---<cfdump var="#RC.data#"> ---> 
<cfset authorarray = rc.data.authorarray>
<!---<cfabort>
<cfdump var="#authorarray#" >--->
  <!---isarray(authorarray) = <cfdump var="#isarray(authorarray)#"><br />
  --->
	 <cfif isarray(authorarray)  >
		<cfset author = authorArray[1] />
		<cfset authorID = author.getauthorID()>
		<cfset createdOn = author.getcreatedOn() />
		
	<cfelse> 
		createdOn
		<cfset createdOn = Now() />
		<cfset author = authorArray />
		<cfset authorID = 0>
	</cfif>
 
<!--- authorEdit.cfm --->
<cfparam name="author" type="any" />

 
<cfoutput>
<cfform action="#Script_Name#?action=author.update" method="post" format="html" enctype="multipart/form-data">
				
		 <input name="authorID" type="hidden" value="#authorID#" />
		 <input name="createdOn" type="hidden" id="createdOn" value="#createdOn#" />
		 <input name="updatedOn" type="hidden" id="updatedOn" value="#Now()#" />
		 
 
	
	<table>
	<tbody>
		<tr>
			<th><label for="firstName">First name:</label></th>
			<td><input name="firstName" type="text" id="firstName" value="#author.getfirstName()#" /></td>
		</tr>
		<tr>
			<th><label for="lastName">Last name:</label></th>
			<td><input name="lastName" type="text" id="lastName" value="#author.getlastName()#" /></td>
		</tr>
		<tr>
			<th><label for="email">Email:</label></th>
			<td><input name="email" type="text" id="email" value="#author.getemail()#" /></td>
		</tr>
	 
		<tr>
			<th><label for="isEditor">Is editor:</label></th>
			<td><input name="isEditor" type="text" id="isEditor" value="#author.getisEditor()#" /></td>
		</tr>
		<tr>
			<th><label for="dob">Dob:</label></th>
			<td>
			<cf_jscalender
				fieldname="dob"
				errormessage="Please select a vaild Date."
				reqired="false"
				size="20"
				jslocation="/ApptacularBlogFW1_New/js/"
				csslocation="/ApptacularBlogFW1_New/js/"
				DateFormat="mm/dd/yyyy"
				value="#author.getdob()#"
				jsDateFormat="%m/%d/%Y"
				showbutton="true"
				useCFForm="true"  >
				
				</td>
		</tr>
		<tr>
			<th />
			<td><input name="save" type="submit" value="Save" /></td>
		</tr>
	</tbody>
	</table>
</cfform>
</cfoutput>
 
 