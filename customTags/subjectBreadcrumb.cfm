<!--- subjectBreadcrumb.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.new" type="boolean" default="false" />
<cfparam name="attributes.subject" type="any" default="" />
<cfset new = attributes.new />
<cfset subject = attributes.subject />
<cfset method = attributes.method />

<cfoutput><p class="breadcrumb">
	<a href="index.cfm">Main</a> / 
		<a href="subject.cfm?method=list">List</a> /
		<cfif CompareNoCase(method, "read") eq 0>
		<a href="subject.cfm?method=edit&amp;subjectID=#subject.getsubjectID()#">Edit</a> /
		<a href="subject.cfm?method=clone&amp;subjectID=#subject.getsubjectID()#&amp;message=clone">Clone</a> /
		</cfif>
		<cfif CompareNoCase(method, "edit") eq 0 and not new>
		<a href="subject.cfm?method=read&amp;subjectID=#subject.getsubjectID()#">Read</a> /
		<a href="subject.cfm?method=clone&amp;subjectID=#subject.getsubjectID()#&amp;message=clone">Clone</a> /
		</cfif>
	<a href="subject.cfm?method=edit">New</a>
</p></cfoutput>

</cfprocessingdirective>
<cfexit method="exitTag" />