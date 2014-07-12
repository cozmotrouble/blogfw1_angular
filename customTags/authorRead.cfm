<!--- authorRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.author" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset author = attributes.author /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Authorid</th>
			<td>#author.getauthorID()#</td>
		</tr>
		<tr>
			<th>Firstname</th>
			<td>#author.getfirstName()#</td>
		</tr>
		<tr>
			<th>Lastname</th>
			<td>#author.getlastName()#</td>
		</tr>
		<tr>
			<th>Email</th>
			<td>#author.getemail()#</td>
		</tr>
		<tr>
			<th>Createdon</th>
			<td>#dateFormat(author.getcreatedOn(),"mm/dd/yyyy" )# #timeFormat(author.getcreatedOn(),"h:mm tt" )#</td>
		</tr>
		<tr>
			<th>Updatedon</th>
			<td>#dateFormat(author.getupdatedOn(),"mm/dd/yyyy" )# #timeFormat(author.getupdatedOn(),"h:mm tt" )#</td>
		</tr>
		<tr>
			<th>Iseditor</th>
			<td>#author.getisEditor()#</td>
		</tr>
		<tr>
			<th>Dob</th>
			<td>#dateFormat(author.getdob(),"mm/dd/yyyy" )#</td>
		</tr>
		<tr>
			<th>Tags</th>
			<td><cf_manyToManyReader  entityname="tag" identity="tagid" foreignKeylabel="name" selected="#author.gettags()#"  /></td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />