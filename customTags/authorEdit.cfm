<!--- authorEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.author" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset author = attributes.author /> 
<cfset message = attributes.message /> 
<cfif CompareNoCase(message, "updated") eq 0>
	<p class="alert">Record updated</p>
<cfelse>
	<p></p>
</cfif>
<cfoutput>
<cfform action="?method=edit_process" method="post" format="html" enctype="multipart/form-data">
	<table>
	<tbody>
			<input name="authorID" type="hidden" value="#author.getauthorID()#" />
		<tr>
			<th><label for="firstName">Firstname:</label></th>
			<td><input name="firstName" type="text" id="firstName" value="#author.getfirstName()#" /></td>
		</tr>
		<tr>
			<th><label for="lastName">Lastname:</label></th>
			<td><input name="lastName" type="text" id="lastName" value="#author.getlastName()#" /></td>
		</tr>
		<tr>
			<th><label for="email">Email:</label></th>
			<td><input name="email" type="text" id="email" value="#author.getemail()#" /></td>
		</tr>
		<tr>
			<th><label for="createdOn">Createdon:</label></th>
			<td>#dateFormat(author.getcreatedOn(),"mm/dd/yyyy" )# #timeFormat(author.getcreatedOn(),"h:mm tt" )#</td>
		</tr>
		<tr>
			<th><label for="updatedOn">Updatedon:</label></th>
			<td>#dateFormat(author.getupdatedOn(),"mm/dd/yyyy" )# #timeFormat(author.getupdatedOn(),"h:mm tt" )#</td>
		</tr>
		<tr>
			<th><label for="isEditor">Iseditor:</label></th>
			<td><input name="isEditor" type="text" id="isEditor" value="#author.getisEditor()#" /></td>
		</tr>
		<tr>
			<th><label for="dob">Dob:</label></th>
			<td><cfinput name="dob" type="datefield" id="dob" value="#DateFormat(author.getdob(),'mm/dd/yyyy')#" /></td>
		</tr>
		<tr>
			<th>Tags</th>
			<td><cf_manyToManySelector name="tags" entityname="tag" identity="tagid" foreignKeylabel="name" selected="#author.gettags()#"  orderby="tagid asc"  /></td>
		</tr>
		<tr>
			<th />
			<td><input name="save" type="submit" value="Save" /></td>
		</tr>
	</tbody>
	</table>
</cfform>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />