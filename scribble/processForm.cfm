<!---<cfset request.layout = not form.isAjaxRequest />--->
<cfscript>
	comment = EntityNew("comment" );
	param name="url.postID" default= 0;
	comment = application.beanFactory.getBean( "comment" );
	  
	cs = {};
 
	//cs.writedump(commentstruct);
	cs.postID = form.postID ;
	cs.body = form.body ;
	cs.name = form.name ;
	cs.email = form.email ;
	cs.website = form.website ;
	cs.createdOn = createoDBCDateTime(now());
	cs.updatedOn =createoDBCDateTime(now());
	 
	cs.commentID = 0;
	comment = comment.populate(rc);
	commentService = variables.beanFactory.getBean( "commentService" );
	commentService.update(comment);  
	 		
</cfscript>

<entity> 
<cfoutput>#cs#</cfoutput> 