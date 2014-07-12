<!--- postRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.post" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset post = attributes.post /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Postid</th>
			<td>#post.getpostID()#</td>
		</tr>
		<tr>
			<th>Title</th>
			<td>#post.gettitle()#</td>
		</tr>
		<tr>
			<th>Body</th>
			<td>#post.getbody()#</td>
		</tr>
		<tr>
			<th>Createdon</th>
			<td>#dateFormat(post.getcreatedOn(),"mm/dd/yyyy" )#</td>
		</tr>
		<tr>
			<th>Updatedon</th>
			<td>#dateFormat(post.getupdatedOn(),"mm/dd/yyyy" )#</td>
		</tr>
		<tr>
			<th>author</th>
			<!--- Deal with all of the issues around showing the a good UI for the foreign [author] object referenced here  --->
			<cfif not isNull(post.getauthor())>
				<td><a href="author.cfm?method=read&amp;authorID=#post.getauthor().getauthorID()#">#post.getauthor().getfirstName()#</a></td>
			<cfelse>
				<td></td>
			</cfif>
		</tr>
		<tr>
			<th>Subjects</th>
			<td><cf_manyToManyReader  entityname="subject" identity="subjectID" foreignKeylabel="name" selected="#post.getsubjects()#"  /></td>
		</tr>
		<tr>
			<th>Tags</th>
			<td><cf_manyToManyReader  entityname="tag" identity="tagid" foreignKeylabel="name" selected="#post.gettags()#"  /></td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />