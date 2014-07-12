<!--- postEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.post" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset post = attributes.post /> 
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
			<input name="postID" type="hidden" value="#post.getpostID()#" />
		<tr>
			<th><label for="title">Title:</label></th>
			<td><input name="title" type="text" id="title" value="#post.gettitle()#" /></td>
		</tr>
		<tr>
			<th><label for="body">Body:</label></th>
			<td><cftextarea name="body"  id="body" value="#post.getbody()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th><label for="createdOn">Createdon:</label></th>
			<td><cfinput name="createdOn" type="datefield" id="createdOn" value="#DateFormat(post.getcreatedOn(),'mm/dd/yyyy')#" /></td>
		</tr>
		<tr>
			<th><label for="updatedOn">Updatedon:</label></th>
			<td><cfinput name="updatedOn" type="datefield" id="updatedOn" value="#DateFormat(post.getupdatedOn(),'mm/dd/yyyy')#" /></td>
		</tr>
		<tr>
			<cfif url.postID eq 0 OR IsNull(post.getauthor())>
				<cfset authorValue = 0 /> 
			<cfelse>
				<cfset authorValue = post.getauthor().getauthorID() />
			</cfif>
			<th><label for="author">Author:</label></th>
			<td><cf_foreignkeySelector name="author" entityname="author" identity="authorID" foreignKeylabel="firstName" fieldValue="#authorValue#" orderby="authorID asc" /></td>
		</tr>
		<tr>
			<th>Subjects</th>
			<td><cf_manyToManySelector name="subjects" entityname="subject" identity="subjectID" foreignKeylabel="name" selected="#post.getsubjects()#"  orderby="subjectID asc"  /></td>
		</tr>
		<tr>
			<th>Tags</th>
			<td><cf_manyToManySelector name="tags" entityname="tag" identity="tagid" foreignKeylabel="name" selected="#post.gettags()#"  orderby="tagid asc"  /></td>
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