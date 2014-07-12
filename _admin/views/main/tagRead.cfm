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
			<td>#tag.getcreatedOn()#</td>
		</tr>
		<tr>
			<th>Updatedon</th>
			<td>#tag.getupdatedOn()#</td>
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