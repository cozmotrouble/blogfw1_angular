<!--- tagList.cfm --->


<cfparam name="url.maxresults" type="numeric" default="-1" />
<cfparam name="url.offset" type="numeric" default="-1" />
<cfparam name="url.message" type="string" default="" />
<cfset tagCount = ormExecuteQuery("select Count(*) from tag")[1]  />
<cfset prevOffset = url.offset - url.maxresults />
<cfset nextOffset = url.offset + url.maxresults />
<cfset pages = Ceiling(tagCount / url.maxresults) />
<cfset tagArray = rc.data.tagArray>

<cfset message = url.message /> 
<cfif CompareNoCase(message, "deleted") eq 0>
	<p class="alert">Record deleted</p>
<cfelse>
	<p></p>
</cfif>
<cfoutput>
<table>
	<thead>
		<tr>
			<th>Tagid</th>
			<th>Name</th>
			<th>Createdon</th>
			<th>Updatedon</th>
			<th>tagCount</th>
		</tr>
	</thead>
	<tbody>
	<cfloop index="i" from="1" to="#ArrayLen(tagArray)#">
		<cfset tag = tagArray[i] />
		<tr<cfif i mod 2> class="odd"</cfif>>
			<td>#tag.gettagid()#</td>
			<td>#tag.getname()#</td>
			<td>#tag.getcreatedOn()#</td>
			<td>#tag.getupdatedOn()#</td>
			<td><!---#tag.gettagCount()#---></td>
			<td class="crudlink"><a href="tag.cfm?method=read&tagid=#tag.gettagid()#">Read</a></td>
			<td class="crudlink"><a href="tag.cfm?method=edit&tagid=#tag.gettagid()#">Edit</a></td>
			<td class="crudlink"><a href="tag.cfm?method=delete_process&tagid=#tag.gettagid()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif url.offset gte 0>
	<tr>
	<td colspan="8">
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
					<cfif nextOffset lt tagCount>
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
 