<!--- postBreadcrumb.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.new" type="boolean" default="false" />
<cfparam name="attributes.post" type="any" default="" />
<cfset new = attributes.new />
<cfset post = attributes.post />
<cfset method = attributes.method />

<cfoutput><p class="breadcrumb">
	<a href="index.cfm">Main</a> / 
		<a href="post.cfm?method=list">List</a> /
		<cfif CompareNoCase(method, "read") eq 0>
		<a href="post.cfm?method=edit&amp;postID=#post.getpostID()#">Edit</a> /
		<a href="post.cfm?method=clone&amp;postID=#post.getpostID()#&amp;message=clone">Clone</a> /
		</cfif>
		<cfif CompareNoCase(method, "edit") eq 0 and not new>
		<a href="post.cfm?method=read&amp;postID=#post.getpostID()#">Read</a> /
		<a href="post.cfm?method=clone&amp;postID=#post.getpostID()#&amp;message=clone">Clone</a> /
		</cfif>
	<a href="post.cfm?method=edit">New</a>
</p></cfoutput>

</cfprocessingdirective>
<cfexit method="exitTag" />