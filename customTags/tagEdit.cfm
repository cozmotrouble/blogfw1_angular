<!--- tagEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.tag" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset tag = attributes.tag /> 
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
			<input name="tagid" type="hidden" value="#tag.gettagid()#" />
		<tr>
			<th><label for="name">Name:</label></th>
			<td><input name="name" type="text" id="name" value="#tag.getname()#" /></td>
		</tr>
		<tr>
			<th><label for="createdOn">Createdon:</label></th>
			<td>#dateFormat(tag.getcreatedOn(),"mm/dd/yyyy" )# #timeFormat(tag.getcreatedOn(),"h:mm tt" )#</td>
		</tr>
		<tr>
			<th><label for="updatedOn">Updatedon:</label></th>
			<td>#dateFormat(tag.getupdatedOn(),"mm/dd/yyyy" )# #timeFormat(tag.getupdatedOn(),"h:mm tt" )#</td>
		</tr>
		<tr>
			<th>Authors</th>
			<td><cf_manyToManySelector name="authors" entityname="author" identity="authorID" foreignKeylabel="firstName" selected="#tag.getauthors()#"  orderby="authorID asc"  /></td>
		</tr>
		<tr>
			<th>Posts</th>
			<td><cf_manyToManySelector name="posts" entityname="post" identity="postID" foreignKeylabel="title" selected="#tag.getposts()#"  orderby="postID asc"  /></td>
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