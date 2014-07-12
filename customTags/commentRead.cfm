<!--- commentRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.comment" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset comment = attributes.comment /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Commentid</th>
			<td>#comment.getcommentID()#</td>
		</tr>
		<tr>
			<th>post</th>
			<!--- Deal with all of the issues around showing the a good UI for the foreign [post] object referenced here  --->
			<cfif not isNull(comment.getpost())>
				<td><a href="post.cfm?method=read&amp;postID=#comment.getpost().getpostID()#">#comment.getpost().gettitle()#</a></td>
			<cfelse>
				<td></td>
			</cfif>
		</tr>
		<tr>
			<th>Body</th>
			<td>#comment.getbody()#</td>
		</tr>
		<tr>
			<th>Name</th>
			<td>#comment.getname()#</td>
		</tr>
		<tr>
			<th>Email</th>
			<td>#comment.getemail()#</td>
		</tr>
		<tr>
			<th>Website</th>
			<td>#comment.getwebsite()#</td>
		</tr>
		<tr>
			<th>Createdon</th>
			<td>#dateFormat(comment.getcreatedOn(),"mm/dd/yyyy" )# #timeFormat(comment.getcreatedOn(),"h:mm tt" )#</td>
		</tr>
		<tr>
			<th>Updatedon</th>
			<td>#dateFormat(comment.getupdatedOn(),"mm/dd/yyyy" )# #timeFormat(comment.getupdatedOn(),"h:mm tt" )#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />