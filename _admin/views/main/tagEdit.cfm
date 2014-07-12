<!--- tagEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.tag" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset tag = attributes.tag /> 
<cfset message = attributes.message /> 
<cfif CompareNoCase(message, "updated") eq 0>
	<p class="alert">Records updated</p>
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
			<td>#tag.getcreatedOn()#</td>
		</tr>
		<tr>
			<th><label for="updatedOn">Updatedon:</label></th>
			<td>#tag.getupdatedOn()#</td>
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