<!--- tagList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
 <cfsetting showdebugoutput="false" />
  
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.tagid" type="any" default="0" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
 <cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfparam name="attributes.message" type="string" default=" " />
 <!---@@@@@@@@@@@@@@@@@@@ --->
 <!---@@@@@@@@@@@@@@@@@@@ --->
 
 

<h2>Tag</h2>

 
		<cfset tagArray = entityLoad("tag", {}, "tagid asc", {offset=url.offset, maxresults=url.maxresults} ) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="tag.cfm?method=edit">New</a>
		</p></cfoutput>
 
 
 <!---@@@@@@@@@@@@@@@@@@@ --->
 <!---@@@@@@@@@@@@@@@@@@@ --->
 

<cfset tagCount = ormExecuteQuery("select Count(*) from tag")[1]  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(tagCount / attributes.maxresults) />







<cfset message = attributes.message /> 
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
			<th>postCount</th>
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
			<td>#tag.getpostCount()#</td>
			<td class="crudlink"><a href="tag.cfm?method=read&tagid=#tag.gettagid()#">Read</a></td>
			<td class="crudlink"><a href="tag.cfm?method=edit&tagid=#tag.gettagid()#">Edit</a></td>
			<td class="crudlink"><a href="tag.cfm?method=delete_process&tagid=#tag.gettagid()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
	<tr>
	<td colspan="8">
		<table class="listnav">
			<tr>
				<td class="prev">
					<cfif prevOffset gte 0>
						<a href="?offset=#prevOffset#&amp;maxresults=#attributes.maxresults#">&larr; Prev</a>
					</cfif>
				</td>
				<td class="pages">
					<cfloop index="i" from="1" to="#pages#">
						<cfset offset = 0 + ((i -1) * attributes.maxresults) />
						<cfif offset eq attributes.offset>
							#i#
						<cfelse>
							<a href="?offset=#offset#&amp;maxresults=#attributes.maxresults#">#i#</a>
						</cfif>
					</cfloop>
				</td>
				<td class="next">
					<cfif nextOffset lt tagCount>
					<a href="?offset=#nextOffset#&amp;maxresults=#attributes.maxresults#">Next &rarr;<a/>
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
</cfprocessingdirective>
