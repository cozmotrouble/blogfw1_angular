<!---<cfset request.layout = not rc.isAjaxRequest />--->
<cfscript>
	//comment = EntityNew("comment" );
	param name="rc.postID" default= "0";
	param name="rc.body" default= "";
	param name="rc.name" default= "";
	param name="rc.email" default= "";
	param name="rc.comment" default= "";
	param name="rc.createdOn" default= "#now()#";
	param name="rc.updatedOn" default= "#now()#";
 	commentObj = application.beanFactory.getBean( "comment" );
	commentObj.populate(rc);
	transaction{
       EntitySave(commentObj); 
       local.commentId = commentObj.getcommentId();
	}
	ormflush();
</cfscript>
<!---<cfdump var="#local.commentId#">--->
 
 