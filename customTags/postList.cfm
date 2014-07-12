<!--- postList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.postArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfparam name="attributes.orderby" type="string" default="" />
<cfparam name="attributes.q" type="string" default="" />
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.totalCount" type="numeric" default="0" />

<cfset postCount = attributes.totalCount  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(postCount / attributes.maxresults) />


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
			<!--- Header for postID --->
			<cfset postIDascOrDesc = (FindNoCase("postID asc", url.orderby))? "desc" : "asc" />
			<cfset postIDascOrDescIcon = (FindNoCase("postID asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=postID #postIDascOrDesc#&amp;q=#attributes.q#">Postid #postIDascOrDescIcon#</a></th>

			<!--- Header for title --->
			<cfset titleascOrDesc = (FindNoCase("title asc", url.orderby))? "desc" : "asc" />
			<cfset titleascOrDescIcon = (FindNoCase("title asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=title #titleascOrDesc#&amp;q=#attributes.q#">Title #titleascOrDescIcon#</a></th>

			<!--- Header for body --->
			<cfset bodyascOrDesc = (FindNoCase("body asc", url.orderby))? "desc" : "asc" />
			<cfset bodyascOrDescIcon = (FindNoCase("body asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=body #bodyascOrDesc#&amp;q=#attributes.q#">Body #bodyascOrDescIcon#</a></th>

			<!--- Header for createdOn --->
			<cfset createdOnascOrDesc = (FindNoCase("createdOn asc", url.orderby))? "desc" : "asc" />
			<cfset createdOnascOrDescIcon = (FindNoCase("createdOn asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=createdOn #createdOnascOrDesc#&amp;q=#attributes.q#">Createdon #createdOnascOrDescIcon#</a></th>

			<!--- Header for updatedOn --->
			<cfset updatedOnascOrDesc = (FindNoCase("updatedOn asc", url.orderby))? "desc" : "asc" />
			<cfset updatedOnascOrDescIcon = (FindNoCase("updatedOn asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=updatedOn #updatedOnascOrDesc#&amp;q=#attributes.q#">Updatedon #updatedOnascOrDescIcon#</a></th>

			<th>Author</th>
			<th>commentCount</th>
			<th>tagCount</th>
			<th>subjectCount</th>
		</tr>
	</thead>
	<tbody>
	<cfloop index="i" from="1" to="#ArrayLen(attributes.postArray)#">
		<cfset post = attributes.postArray[i] />
		<tr<cfif i mod 2> class="odd"</cfif>>
			<td>#post.getpostID()#</td>
			<td>#post.gettitle()#</td>
			<td>#post.getbody()#</td>
			<td>#dateFormat(post.getcreatedOn(),"mm/dd/yyyy" )#</td>
			<td>#dateFormat(post.getupdatedOn(),"mm/dd/yyyy" )#</td>
			<!--- Deal with all of the issues around showing the a good UI for the foreign [author] object referenced here  --->
			<cfif not isNull(post.getauthor())>
				<td><a href="author.cfm?method=read&amp;authorID=#post.getauthor().getauthorID()#">#post.getauthor().getfirstName()#</a></td>
			<cfelse>
				<td></td>
			</cfif>
			<td>#post.getcommentCount()#</td>
			<td>#post.gettagCount()#</td>
			<td>#post.getsubjectCount()#</td>
			<td class="crudlink"><a href="post.cfm?method=read&postID=#post.getpostID()#">Read</a></td>
			<td class="crudlink"><a href="post.cfm?method=edit&postID=#post.getpostID()#">Edit</a></td>
			<td class="crudlink"><a href="post.cfm?method=delete_process&postID=#post.getpostID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
<cfif pages gt 1>
	<tr>
	<td colspan="12">
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
					<cfif nextOffset lt postCount>
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