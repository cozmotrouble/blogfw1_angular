<!--- tagRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.tag" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset tag = attributes.tag /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Tagid</th>
			<td>#tag.gettagid()#</td>
		</tr>
		<tr>
			<th>Name</th>
			<td>#tag.getname()#</td>
		</tr>
		<tr>
			<th>Createdon</th>
			<td>#dateFormat(tag.getcreatedOn(),"mm/dd/yyyy" )# #timeFormat(tag.getcreatedOn(),"h:mm tt" )#</td>
		</tr>
		<tr>
			<th>Updatedon</th>
			<td>#dateFormat(tag.getupdatedOn(),"mm/dd/yyyy" )# #timeFormat(tag.getupdatedOn(),"h:mm tt" )#</td>
		</tr>
		<tr>
			<th>Authors</th>
			<td><cf_manyToManyReader  entityname="author" identity="authorID" foreignKeylabel="firstName" selected="#tag.getauthors()#"  /></td>
		</tr>
		<tr>
			<th>Posts</th>
			<td><cf_manyToManyReader  entityname="post" identity="postID" foreignKeylabel="title" selected="#tag.getposts()#"  /></td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />