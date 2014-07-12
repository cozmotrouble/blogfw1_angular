<!--- authorBreadcrumb.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.new" type="boolean" default="false" />
<cfparam name="attributes.author" type="any" default="" />
<cfset new = attributes.new />
<cfset author = attributes.author />
<cfset method = attributes.method />

<cfoutput><p class="breadcrumb">
	<a href="index.cfm">Main</a> / 
		<a href="author.cfm?method=list">List</a> /
		<cfif CompareNoCase(method, "read") eq 0>
		<a href="author.cfm?method=edit&amp;authorID=#author.getauthorID()#">Edit</a> /
		<a href="author.cfm?method=clone&amp;authorID=#author.getauthorID()#&amp;message=clone">Clone</a> /
		</cfif>
		<cfif CompareNoCase(method, "edit") eq 0 and not new>
		<a href="author.cfm?method=read&amp;authorID=#author.getauthorID()#">Read</a> /
		<a href="author.cfm?method=clone&amp;authorID=#author.getauthorID()#&amp;message=clone">Clone</a> /
		</cfif>
	<a href="author.cfm?method=edit">New</a>
</p></cfoutput>

</cfprocessingdirective>
<cfexit method="exitTag" />