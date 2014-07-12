<!--- subjectEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.subject" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset subject = attributes.subject /> 
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
			<input name="subjectID" type="hidden" value="#subject.getsubjectID()#" />
		<tr>
			<th><label for="name">Name:</label></th>
			<td><input name="name" type="text" id="name" value="#subject.getname()#" /></td>
		</tr>
		<tr>
			<th><label for="createdOn">Createdon:</label></th>
			<td>#dateFormat(subject.getcreatedOn(),"mm/dd/yyyy" )# #timeFormat(subject.getcreatedOn(),"h:mm tt" )#</td>
		</tr>
		<tr>
			<th><label for="updatedOn">Updatedon:</label></th>
			<td>#dateFormat(subject.getupdatedOn(),"mm/dd/yyyy" )# #timeFormat(subject.getupdatedOn(),"h:mm tt" )#</td>
		</tr>
		<tr>
			<th>Posts</th>
			<td><cf_manyToManySelector name="posts" entityname="post" identity="postID" foreignKeylabel="title" selected="#subject.getposts()#"  orderby="postID asc"  /></td>
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