<!--- commentEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.comment" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset comment = attributes.comment /> 
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
			<input name="commentID" type="hidden" value="#comment.getcommentID()#" />
		<tr>
			<cfif url.commentID eq 0 OR IsNull(comment.getpost())>
				<cfset postValue = 0 /> 
			<cfelse>
				<cfset postValue = comment.getpost().getpostID() />
			</cfif>
			<th><label for="post">Post:</label></th>
			<td><cf_foreignkeySelector name="post" entityname="post" identity="postID" foreignKeylabel="title" fieldValue="#postValue#" orderby="postID asc" /></td>
		</tr>
		<tr>
			<th><label for="body">Body:</label></th>
			<td><cftextarea name="body"  id="body" value="#comment.getbody()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th><label for="name">Name:</label></th>
			<td><input name="name" type="text" id="name" value="#comment.getname()#" /></td>
		</tr>
		<tr>
			<th><label for="email">Email:</label></th>
			<td><input name="email" type="text" id="email" value="#comment.getemail()#" /></td>
		</tr>
		<tr>
			<th><label for="website">Website:</label></th>
			<td><input name="website" type="text" id="website" value="#comment.getwebsite()#" /></td>
		</tr>
		<tr>
			<th><label for="createdOn">Createdon:</label></th>
			<td>#dateFormat(comment.getcreatedOn(),"mm/dd/yyyy" )# #timeFormat(comment.getcreatedOn(),"h:mm tt" )#</td>
		</tr>
		<tr>
			<th><label for="updatedOn">Updatedon:</label></th>
			<td>#dateFormat(comment.getupdatedOn(),"mm/dd/yyyy" )# #timeFormat(comment.getupdatedOn(),"h:mm tt" )#</td>
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