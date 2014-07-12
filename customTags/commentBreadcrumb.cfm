<!--- commentBreadcrumb.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.new" type="boolean" default="false" />
<cfparam name="attributes.comment" type="any" default="" />
<cfset new = attributes.new />
<cfset comment = attributes.comment />
<cfset method = attributes.method />

<cfoutput><p class="breadcrumb">
	<a href="index.cfm">Main</a> / 
		<a href="comment.cfm?method=list">List</a> /
		<cfif CompareNoCase(method, "read") eq 0>
		<a href="comment.cfm?method=edit&amp;commentID=#comment.getcommentID()#">Edit</a> /
		<a href="comment.cfm?method=clone&amp;commentID=#comment.getcommentID()#&amp;message=clone">Clone</a> /
		</cfif>
		<cfif CompareNoCase(method, "edit") eq 0 and not new>
		<a href="comment.cfm?method=read&amp;commentID=#comment.getcommentID()#">Read</a> /
		<a href="comment.cfm?method=clone&amp;commentID=#comment.getcommentID()#&amp;message=clone">Clone</a> /
		</cfif>
	<a href="comment.cfm?method=edit">New</a>
</p></cfoutput>

</cfprocessingdirective>
<cfexit method="exitTag" />