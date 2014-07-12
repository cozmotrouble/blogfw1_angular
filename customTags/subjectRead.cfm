<!--- subjectRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.subject" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset subject = attributes.subject /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Subjectid</th>
			<td>#subject.getsubjectID()#</td>
		</tr>
		<tr>
			<th>Name</th>
			<td>#subject.getname()#</td>
		</tr>
		<tr>
			<th>Createdon</th>
			<td>#dateFormat(subject.getcreatedOn(),"mm/dd/yyyy" )# #timeFormat(subject.getcreatedOn(),"h:mm tt" )#</td>
		</tr>
		<tr>
			<th>Updatedon</th>
			<td>#dateFormat(subject.getupdatedOn(),"mm/dd/yyyy" )# #timeFormat(subject.getupdatedOn(),"h:mm tt" )#</td>
		</tr>
		<tr>
			<th>Posts</th>
			<td><cf_manyToManyReader  entityname="post" identity="postID" foreignKeylabel="title" selected="#subject.getposts()#"  /></td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />