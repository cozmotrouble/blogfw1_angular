 <cfparam name="url.maxresults" type="numeric" default="-1" />
<cfparam name="url.offset" type="numeric" default="-1" />		
<cfset authorCount = ormExecuteQuery("select Count(*) from author")[1]  />
<cfset prevOffset = url.offset - url.maxresults />
<cfset nextOffset = url.offset + url.maxresults />
<cfset pages = Ceiling(authorCount / url.maxresults) />
<cfparam name="rc.message" default="">
<cfset authorArray = rc.data.authorArray>
<cfoutput>

<table class="table table-striped" >
	<thead>
		<tr class="img-rounded">
<!---			<th>Authorid</th>--->
			<th>Name </th>
			<th>Email</th>
			<th>Created </th>
			<th>Updated </th>
			<th>Is editor</th>
			<th>Dob</th>
			<th>  </th>
			<th>  </th>
			<th>  </th>
		</tr>
	</thead>
	<tbody>
	<cfloop index="i" from="1" to="#ArrayLen(authorArray)#">
		<cfset author = authorArray[i] />
		<tr<cfif i mod 2> class="odd"</cfif>>
<!---			<td>#author.getauthorID()#</td>--->
			<td>
			<a   href="#buildURL( action = "author.edit", queryString = "?method=edit&authorID=#author.getauthorID()#")#">
				<i class="icon-edit"></i> #author.getfirstName()#  #author.getlastName()#</a>
			</td> 
			<td>#author.getemail()#</td>
			<td>#dateformat( author.getcreatedOn(),"short" )#</td>
			<td>#dateformat( author.getupdatedOn(),"short" )#</td>
			<td>#author.getisEditor()#</td>
			<td>#dateFormat(author.getdob(),"mm/dd/yyyy" )# &nbsp;</td>
<!---			<td class="crudlink"><a class="btn btn-mini" href="author.cfm?method=read&authorID=#author.getauthorID()#">  <i class="icon-search"></i>  Read</a></td>
--->			
			<td class="crudlink"><a class="btn btn-mini" href="#buildURL( action = "author.edit", queryString = "?method=edit&authorID=#author.getauthorID()#")#"><i class="icon-edit"></i> Edit</a></td>
		 	<td class="crudlink"><a class="btn btn-mini" href="#buildURL( action = "author.delete", queryString = "?method=delete&authorID=#author.getauthorID()#")#"   > <i class="icon-remove"></i>  Delete</a></td>
 		</tr>
	</cfloop> 
<cfif url.offset gte 0>
	<tr> 
	<td colspan="12">
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
					<cfif nextOffset lt authorCount>
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
