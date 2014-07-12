<!--- postEdit.cfm --->
<!---<cfdump var="#RC.data#"> ---> 
<cfset postarray = rc.data.postarray>
<!---<cfabort>
<cfdump var="#postarray#" >--->
  <!---isarray(postarray) = <cfdump var="#isarray(postarray)#"><br />
  --->
	 <cfif isarray(postarray)  >
		<cfset post = postArray[1] />
		<cfset postID = post.getpostID()>
		<cfset createdOn = post.getcreatedOn() />
		
	<cfelse> 
		createdOn
		<cfset createdOn = Now() />
		<cfset post = postArray />
		<cfset postID = 0>
	</cfif>
 
 <cfparam name="MESSAGE" default="">


<cfif CompareNoCase(message, "updated") eq 0>
	<p class="alert">Records updated</p>
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
			<td><input name="body" type="text" id="body" value="#post.getbody()#" /></td>
		</tr>
		<tr>
			<th><label for="createdOn">Createdon:</label></th>
			<td>#post.getcreatedOn()#</td>
		</tr>
		<tr>
			<th><label for="updatedOn">Updatedon:</label></th>
			<td>#post.getupdatedOn()#</td>
		</tr>
 		<tr>
			<cfif url.postID eq 0 OR IsNull(post.getauthor())>
				<cfset authorValue = 0 /> 
			<cfelse>
				<cfset authorValue = post.getauthor().getauthorID() />
			</cfif>
			<th><label for="author">Author:</label></th>
			<td><cf_foreignkeySelector name="author" entityname="author" identity="authorID" foreignKeylabel="firstName" fieldValue="#authorValue#" orderby="authorID asc" /></td>
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
</cfform><!---<cfdump var="#post.gettags()#">--->
</cfoutput> 
<cfdump var="#post#">
