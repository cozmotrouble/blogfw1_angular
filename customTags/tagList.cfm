<!--- tagList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.tagArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfparam name="attributes.orderby" type="string" default="" />
<cfparam name="attributes.q" type="string" default="" />
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.totalCount" type="numeric" default="0" />

<cfset tagCount = attributes.totalCount  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(tagCount / attributes.maxresults) />


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
			<!--- Header for tagid --->
			<cfset tagidascOrDesc = (FindNoCase("tagid asc", url.orderby))? "desc" : "asc" />
			<cfset tagidascOrDescIcon = (FindNoCase("tagid asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=tagid #tagidascOrDesc#&amp;q=#attributes.q#">Tagid #tagidascOrDescIcon#</a></th>

			<!--- Header for name --->
			<cfset nameascOrDesc = (FindNoCase("name asc", url.orderby))? "desc" : "asc" />
			<cfset nameascOrDescIcon = (FindNoCase("name asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=name #nameascOrDesc#&amp;q=#attributes.q#">Name #nameascOrDescIcon#</a></th>

			<!--- Header for createdOn --->
			<cfset createdOnascOrDesc = (FindNoCase("createdOn asc", url.orderby))? "desc" : "asc" />
			<cfset createdOnascOrDescIcon = (FindNoCase("createdOn asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=createdOn #createdOnascOrDesc#&amp;q=#attributes.q#">Createdon #createdOnascOrDescIcon#</a></th>

			<!--- Header for updatedOn --->
			<cfset updatedOnascOrDesc = (FindNoCase("updatedOn asc", url.orderby))? "desc" : "asc" />
			<cfset updatedOnascOrDescIcon = (FindNoCase("updatedOn asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=updatedOn #updatedOnascOrDesc#&amp;q=#attributes.q#">Updatedon #updatedOnascOrDescIcon#</a></th>

			<th>authorCount</th>
			<th>postCount</th>
		</tr>
	</thead>
	<tbody>
	<cfloop index="i" from="1" to="#ArrayLen(attributes.tagArray)#">
		<cfset tag = attributes.tagArray[i] />
		<tr<cfif i mod 2> class="odd"</cfif>>
			<td>#tag.gettagid()#</td>
			<td>#tag.getname()#</td>
			<td>#dateFormat(tag.getcreatedOn(),"mm/dd/yyyy" )# #timeFormat(tag.getcreatedOn(),"h:mm tt" )#</td>
			<td>#dateFormat(tag.getupdatedOn(),"mm/dd/yyyy" )# #timeFormat(tag.getupdatedOn(),"h:mm tt" )#</td>
			<td>#tag.getauthorCount()#</td>
			<td>#tag.getpostCount()#</td>
			<td class="crudlink"><a href="tag.cfm?method=read&tagid=#tag.gettagid()#">Read</a></td>
			<td class="crudlink"><a href="tag.cfm?method=edit&tagid=#tag.gettagid()#">Edit</a></td>
			<td class="crudlink"><a href="tag.cfm?method=delete_process&tagid=#tag.gettagid()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
<cfif pages gt 1>
	<tr>
	<td colspan="9">
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
					<cfif nextOffset lt tagCount>
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