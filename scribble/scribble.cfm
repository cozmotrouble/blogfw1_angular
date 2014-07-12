

<cfscript>
 
 
	  
	 commentstruct = {};
	 writedump(commentstruct);
/*	 postID = rc. ;
	 body = rc.body ;
	 name = rc.name ;
	 email = rc.email ;
	 website = rc.website ;
	 createdOn = rc.createdOn ;
	 updatedOn = rc.updatedOn ;
	 
	 
	 
	  
	  
	  comment = comment.populate(rc);
	  commentService = variables.beanFactory.getBean( "commentService" );
	  populate(required struct formStruct )*/
</cfscript>
 





SELECT id, 
       entryidfk, 
       name, 
       email, 
       comment, 
       posted, 
       subscribe, 
       website, 
       moderated, 
       killcomment, 
       subscribeonly 
FROM   myinternetisbroken.tblblogcomments 
 

INSERT INTO comment 
            (postid, 
             body, 
             name, 
             email, 
             website, 
             createdon, 
             updatedon) 
VALUES      (2, 
             '#getcomment.comment#', 
             '#getcomment.name#', 
             '#getcomment.email#', 
             '#getcomment.website#', 
             '#getcomment.posted#', 
             '#getcomment.posted#'); 
			 
			 
			 SELECT  id,  entryidfk,  name,  email,   comment ,  posted,  subscribe,  website,  moderated,  killcomment,  subscribeonly FROM myinternetisbroken.tblblogcomments LIMIT 1000;
