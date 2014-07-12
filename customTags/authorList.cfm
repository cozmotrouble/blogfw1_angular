<!--- authorList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.authorArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfparam name="attributes.orderby" type="string" default="" />
<cfparam name="attributes.q" type="string" default="" />
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.totalCount" type="numeric" default="0" />

<cfset authorCount = attributes.totalCount  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(authorCount / attributes.maxresults) />


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
			<!--- Header for authorID --->
			<cfset authorIDascOrDesc = (FindNoCase("authorID asc", url.orderby))? "desc" : "asc" />
			<cfset authorIDascOrDescIcon = (FindNoCase("authorID asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=authorID #authorIDascOrDesc#&amp;q=#attributes.q#">Authorid #authorIDascOrDescIcon#</a></th>

			<!--- Header for firstName --->
			<cfset firstNameascOrDesc = (FindNoCase("firstName asc", url.orderby))? "desc" : "asc" />
			<cfset firstNameascOrDescIcon = (FindNoCase("firstName asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=firstName #firstNameascOrDesc#&amp;q=#attributes.q#">Firstname #firstNameascOrDescIcon#</a></th>

			<!--- Header for lastName --->
			<cfset lastNameascOrDesc = (FindNoCase("lastName asc", url.orderby))? "desc" : "asc" />
			<cfset lastNameascOrDescIcon = (FindNoCase("lastName asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=lastName #lastNameascOrDesc#&amp;q=#attributes.q#">Lastname #lastNameascOrDescIcon#</a></th>

			<!--- Header for email --->
			<cfset emailascOrDesc = (FindNoCase("email asc", url.orderby))? "desc" : "asc" />
			<cfset emailascOrDescIcon = (FindNoCase("email asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=email #emailascOrDesc#&amp;q=#attributes.q#">Email #emailascOrDescIcon#</a></th>

			<!--- Header for createdOn --->
			<cfset createdOnascOrDesc = (FindNoCase("createdOn asc", url.orderby))? "desc" : "asc" />
			<cfset createdOnascOrDescIcon = (FindNoCase("createdOn asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=createdOn #createdOnascOrDesc#&amp;q=#attributes.q#">Createdon #createdOnascOrDescIcon#</a></th>

			<!--- Header for updatedOn --->
			<cfset updatedOnascOrDesc = (FindNoCase("updatedOn asc", url.orderby))? "desc" : "asc" />
			<cfset updatedOnascOrDescIcon = (FindNoCase("updatedOn asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=updatedOn #updatedOnascOrDesc#&amp;q=#attributes.q#">Updatedon #updatedOnascOrDescIcon#</a></th>

			<!--- Header for isEditor --->
			<cfset isEditorascOrDesc = (FindNoCase("isEditor asc", url.orderby))? "desc" : "asc" />
			<cfset isEditorascOrDescIcon = (FindNoCase("isEditor asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=isEditor #isEditorascOrDesc#&amp;q=#attributes.q#">Iseditor #isEditorascOrDescIcon#</a></th>

			<!--- Header for dob --->
			<cfset dobascOrDesc = (FindNoCase("dob asc", url.orderby))? "desc" : "asc" />
			<cfset dobascOrDescIcon = (FindNoCase("dob asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=dob #dobascOrDesc#&amp;q=#attributes.q#">Dob #dobascOrDescIcon#</a></th>

			<th>postCount</th>
			<th>tagCount</th>
		</tr>
	</thead>
	<tbody>
	<cfloop index="i" from="1" to="#ArrayLen(attributes.authorArray)#">
		<cfset author = attributes.authorArray[i] />
		<tr<cfif i mod 2> class="odd"</cfif>>
			<td>#author.getauthorID()#</td>
			<td>#author.getfirstName()#</td>
			<td>#author.getlastName()#</td>
			<td>#author.getemail()#</td>
			<td>#dateFormat(author.getcreatedOn(),"mm/dd/yyyy" )# #timeFormat(author.getcreatedOn(),"h:mm tt" )#</td>
			<td>#dateFormat(author.getupdatedOn(),"mm/dd/yyyy" )# #timeFormat(author.getupdatedOn(),"h:mm tt" )#</td>
			<td>#author.getisEditor()#</td>
			<td>#dateFormat(author.getdob(),"mm/dd/yyyy" )#</td>
			<td>#author.getpostCount()#</td>
			<td>#author.gettagCount()#</td>
			<td class="crudlink"><a href="author.cfm?method=read&authorID=#author.getauthorID()#">Read</a></td>
			<td class="crudlink"><a href="author.cfm?method=edit&authorID=#author.getauthorID()#">Edit</a></td>
			<td class="crudlink"><a href="author.cfm?method=delete_process&authorID=#author.getauthorID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
<cfif pages gt 1>
	<tr>
	<td colspan="13">
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
					<cfif nextOffset lt authorCount>
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