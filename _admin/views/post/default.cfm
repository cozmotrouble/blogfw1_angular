<!--- postList.cfm --->
 <cfparam name="url.maxresults" type="numeric" default="-1" />
<cfparam name="url.offset" type="numeric" default="-1" />	
<cfset postCount = ormExecuteQuery("select Count(*) from post")[1]  />
<cfset prevOffset = url.offset - url.maxresults />
<cfset nextOffset = url.offset + url.maxresults />
<cfset pages = Ceiling(postCount / url.maxresults) />
<cfset postArray = rc.data.postArray>

<cfparam name="rc.message" default="">
<cfoutput>
<table>
	<thead>
		<tr>
			<th>Postid</th>
			<th>Title</th>
			<th>Body</th>
			<th>Createdon</th>
			<th>Updatedon</th>
			<th>Author</th>
			<th>commentCount</th>
			<th>tagCount</th>
		</tr>
	</thead>
	<tbody>
	<cfloop index="i" from="1" to="#ArrayLen(postArray)#">
		<cfset post = postArray[i] />
		<tr<cfif i mod 2> class="odd"</cfif>>
			<td>#post.getpostID()#</td>
			<td>#post.gettitle()#</td>
			<td>#post.getbody()#</td>
			<td>#post.getcreatedOn()#</td>
			<td>#post.getupdatedOn()#</td>
			<!--- Deal with all of the issues around showing the a good UI for the foreign [author] object referenced here  --->
			<cfif not isNull(post.getauthor())>
				<td><a href="author.cfm?method=read&amp;authorID=#post.getauthor().getauthorID()#">#post.getauthor().getfirstName()#</a></td>
			<cfelse>
				<td></td>
			</cfif>
			<td>#post.getcommentCount()#</td>
			<td>#post.gettagCount()#</td>
			<td class="crudlink"><a href="post.cfm?method=read&postID=#post.getpostID()#">Read</a></td>
	<!---		<td class="crudlink"><a href="post.cfm?method=edit&postID=#post.getpostID()#">Edit</a></td>
			<td class="crudlink"><a href="post.cfm?method=delete_process&postID=#post.getpostID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
	--->
	
			<td class="crudlink"><a class="btn btn-mini" href="#buildURL( action = "post.edit", queryString = "?method=edit&postID=#post.getpostID()#")#"><i class="icon-edit"></i> Edit</a></td>
		 	<td class="crudlink"><a class="btn btn-mini" href="#buildURL( action = "post.delete", queryString = "?method=delete&postID=#post.getpostID()#")#"   > <i class="icon-remove"></i>  Delete</a></td>
 		
	
		</tr>
	</cfloop>
<cfif url.offset gte 0>
	<tr>
	<td colspan="11">
		<table class="listnav">
			<tr>
				<td class="prev">
					<cfif prevOffset gte 0>
						<a href="?offset=#prevOffset#&amp;maxresults=#url.maxresults#">&larr; Prev</a>
					</cfif>
				</td>
				<td class="pages">
					<cfloop index="i" from="1" to="#pages#">
						<cfset offset = 0 + ((i -1) * url.maxresults) />
						<cfif offset eq url.offset>
							#i#
						<cfelse>
							<a href="?offset=#offset#&amp;maxresults=#url.maxresults#">#i#</a>
						</cfif>
					</cfloop>
				</td>
				<td class="next">
					<cfif nextOffset lt postCount>
					<a href="?offset=#nextOffset#&amp;maxresults=#url.maxresults#">Next &rarr;<a/>
					</cfif>
				</td>
			</tr>
		</table>
	</td>
	</tr>
</cfif>
	</tbody>
	</cfoutput>
</table>
