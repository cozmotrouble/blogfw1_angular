<!--- tagBreadcrumb.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.new" type="boolean" default="false" />
<cfparam name="attributes.tag" type="any" default="" />
<cfset new = attributes.new />
<cfset tag = attributes.tag />
<cfset method = attributes.method />

<cfoutput><p class="breadcrumb">
	<a href="index.cfm">Main</a> / 
		<a href="tag.cfm?method=list">List</a> /
		<cfif CompareNoCase(method, "read") eq 0>
		<a href="tag.cfm?method=edit&amp;tagid=#tag.gettagid()#">Edit</a> /
		<a href="tag.cfm?method=clone&amp;tagid=#tag.gettagid()#&amp;message=clone">Clone</a> /
		</cfif>
		<cfif CompareNoCase(method, "edit") eq 0 and not new>
		<a href="tag.cfm?method=read&amp;tagid=#tag.gettagid()#">Read</a> /
		<a href="tag.cfm?method=clone&amp;tagid=#tag.gettagid()#&amp;message=clone">Clone</a> /
		</cfif>
	<a href="tag.cfm?method=edit">New</a>
</p></cfoutput>

</cfprocessingdirective>
<cfexit method="exitTag" />