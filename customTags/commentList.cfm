<!--- commentList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.commentArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfparam name="attributes.orderby" type="string" default="" />
<cfparam name="attributes.q" type="string" default="" />
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.totalCount" type="numeric" default="0" />

<cfset commentCount = attributes.totalCount  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(commentCount / attributes.maxresults) />


<cfset message = attributes.message /> 
<cfif CompareNoCase(message, "deleted") eq 0>
	<p class="alert">Record deleted</p>
<cfelseif CompareNoCase(message, "search") eq 0>
	<p class="alert">Results for <em>"<cfoutput>#attributes.q#</cfoutput>"</em></p>
<cfelse>
	<p></p>
</cfif>
<cfoutput>
<table>
	<thead>
		<tr>
			<!--- Header for commentID --->
			<cfset commentIDascOrDesc = (FindNoCase("commentID asc", url.orderby))? "desc" : "asc" />
			<cfset commentIDascOrDescIcon = (FindNoCase("commentID asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=commentID #commentIDascOrDesc#&amp;q=#attributes.q#">Commentid #commentIDascOrDescIcon#</a></th>

			<th>Post</th>
			<!--- Header for body --->
			<cfset bodyascOrDesc = (FindNoCase("body asc", url.orderby))? "desc" : "asc" />
			<cfset bodyascOrDescIcon = (FindNoCase("body asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=body #bodyascOrDesc#&amp;q=#attributes.q#">Body #bodyascOrDescIcon#</a></th>

			<!--- Header for name --->
			<cfset nameascOrDesc = (FindNoCase("name asc", url.orderby))? "desc" : "asc" />
			<cfset nameascOrDescIcon = (FindNoCase("name asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=name #nameascOrDesc#&amp;q=#attributes.q#">Name #nameascOrDescIcon#</a></th>

			<!--- Header for email --->
			<cfset emailascOrDesc = (FindNoCase("email asc", url.orderby))? "desc" : "asc" />
			<cfset emailascOrDescIcon = (FindNoCase("email asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=email #emailascOrDesc#&amp;q=#attributes.q#">Email #emailascOrDescIcon#</a></th>

			<!--- Header for website --->
			<cfset websiteascOrDesc = (FindNoCase("website asc", url.orderby))? "desc" : "asc" />
			<cfset websiteascOrDescIcon = (FindNoCase("website asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=website #websiteascOrDesc#&amp;q=#attributes.q#">Website #websiteascOrDescIcon#</a></th>

			<!--- Header for createdOn --->
			<cfset createdOnascOrDesc = (FindNoCase("createdOn asc", url.orderby))? "desc" : "asc" />
			<cfset createdOnascOrDescIcon = (FindNoCase("createdOn asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=createdOn #createdOnascOrDesc#&amp;q=#attributes.q#">Createdon #createdOnascOrDescIcon#</a></th>

			<!--- Header for updatedOn --->
			<cfset updatedOnascOrDesc = (FindNoCase("updatedOn asc", url.orderby))? "desc" : "asc" />
			<cfset updatedOnascOrDescIcon = (FindNoCase("updatedOn asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=updatedOn #updatedOnascOrDesc#&amp;q=#attributes.q#">Updatedon #updatedOnascOrDescIcon#</a></th>

		</tr>
	</thead>
	<tbody>
	<cfloop index="i" from="1" to="#ArrayLen(attributes.commentArray)#">
		<cfset comment = attributes.commentArray[i] />
		<tr<cfif i mod 2> class="odd"</cfif>>
			<td>#comment.getcommentID()#</td>
			<!--- Deal with all of the issues around showing the a good UI for the foreign [post] object referenced here  --->
			<cfif not isNull(comment.getpost())>
				<td><a href="post.cfm?method=read&amp;postID=#comment.getpost().getpostID()#">#comment.getpost().gettitle()#</a></td>
			<cfelse>
				<td></td>
			</cfif>
			<td>#comment.getbody()#</td>
			<td>#comment.getname()#</td>
			<td>#comment.getemail()#</td>
			<td>#comment.getwebsite()#</td>
			<td>#dateFormat(comment.getcreatedOn(),"mm/dd/yyyy" )# #timeFormat(comment.getcreatedOn(),"h:mm tt" )#</td>
			<td>#dateFormat(comment.getupdatedOn(),"mm/dd/yyyy" )# #timeFormat(comment.getupdatedOn(),"h:mm tt" )#</td>
			<td class="crudlink"><a href="comment.cfm?method=read&commentID=#comment.getcommentID()#">Read</a></td>
			<td class="crudlink"><a href="comment.cfm?method=edit&commentID=#comment.getcommentID()#">Edit</a></td>
			<td class="crudlink"><a href="comment.cfm?method=delete_process&commentID=#comment.getcommentID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
<cfif pages gt 1>
	<tr>
	<td colspan="11">
		<table class="listnav">
			<tr>
				<td class="prev">
					<cfif prevOffset gte 0>
						<a href="?method=#attributes.method#&amp;offset=#prevOffset#&amp;maxresults=#attributes.maxresults#&amp;orderby=#attributes.orderby#&amp;q=#url.q#">&larr; Prev</a>
					</cfif>
				</td>
				<td class="pages">
					<cfloop index="i" from="1" to="#pages#">
						<cfset offset = 0 + ((i -1) * attributes.maxresults) />
						<cfif offset eq attributes.offset>
							#i#
						<cfelse>
							<a href="?method=#attributes.method#&amp;offset=#offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=#attributes.orderby#&amp;q=#url.q#">#i#</a>
						</cfif>
					</cfloop>
				</td>
				<td class="next">
					<cfif nextOffset lt commentCount>
					<a href="?method=#attributes.method#&amp;offset=#nextOffset#&amp;maxresults=#attributes.maxresults#&amp;orderby=#attributes.orderby#&amp;q=#url.q#">Next &rarr;<a/>
					</cfif>
				</td>
			</tr>
		</table>
	</td>
	</tr>
</cfif>
	</tbody>
</cfif>
	</cfoutput>
</table>
</cfprocessingdirective>
<cfexit method="exitTag" />