


<cfparam name="title" default="">
<cfparam name="category" default="">


<!---
INSERT INTO apptacular_blog.post 
            (title, 
             body, 
             createdon, 
             updatedon, 
             authorid, 
             fk_authorid) 
VALUES      ('dsdd', 
             'asddd', 
             '2014-07-11', 
             '2014-07-11', 
             1, 
             1);---> 
 
<cfquery name="getposts" datasource="myinternetisbroken" >

SELECT  postID  FROM apptacular_blog.post ORDER BY postID ASC ;
</cfquery> 
<cfquery name="getcomments" datasource="myinternetisbroken" >

SELECT  commentID,  postID,  LEFT(body, 256),  name,  email,  website,  createdOn,  updatedOn FROM apptacular_blog.comment 
</cfquery> 
	
	<cfset IDList = valuelist(getposts.postID)>


<cfoutput query="getcomments">
	
<cfset  randompostID =randRange(1,listlen(IDList),"CFMX_COMPAT" )>
	
	
<!---	#listgetAt(IDList,randompostID)# <br />--->
	
 	<cfquery name="updatecomment" datasource="myinternetisbroken" >
 		UPDATE apptacular_blog.comment
		SET postid=#listgetAt(IDList,randompostID)# 
		WHERE  commentID= #getcomments.commentID#;
</cfquery>  
</cfoutput>

done<cfabort>





<cfdump var="#listlen(valuelist(getposts.postID))#"><cfabort>

<cfquery name="blogentries" datasource="myinternetisbroken" >
 
SELECT id, 
       title, 
       body, 
       posted, 
       morebody, 
 
       alias, 
       username, 
       blog, 
       allowcomments, 
       enclosure, 
       filesize, 
       mimetype, 
       views, 
       released, 
       mailed, 
       summary, 
       subtitle, 
       keywords, 
       duration 
FROM   myinternetisbroken.tblblogentries 
 
 WHERE myinternetisbroken.tblblogentries.released =1
	</cfquery> 
<cfquery name="getcomments" datasource="myinternetisbroken" >
 
		SELECT commentID, postID, body, name, email, website, createdOn, updatedOn FROM apptacular_blog.comment1
	</cfquery> 
 
 	<cfset counter = 0>
 <cfoutput query="blogentries">
 	
 	<cfset counter = counter+ 1>
 <!---
	INSERT INTO apptacular_blog.post 
	            (title, 
	             body, 
	             createdon, 
	             updatedon, 
	             authorid, 
	             fk_authorid) 
	VALUES      (#blogentries.title#', 
	             '#blogentries.body#', 
	             '2014-07-11', 
	             '2014-07-11', 
	             1,  --->
  <!---
 <cfquery name="insert_tblblogentries" datasource="apptacular_blog" >

	
	INSERT INTO  post 
	            (title, 
	             body, 
	             createdon, 
	             updatedon, 
	             authorid, 
	             fk_authorid) 
	VALUES      ('#blogentries.title#', 
	             '#blogentries.body#', 
	             '2014-07-11', 
	             '2014-07-11', 
	             1, 
	             1); 
 

	</cfquery>  --->
	
	</cfoutput>
	 counter = <cfdump var="#counter#"><br />
	done
	<cfabort>
	
 
	
 WHERE  commentID=210
	
	
	
	
	
	
	
	
	
	
	
	
	
<!---	
 
	<cfquery name="getcomment" datasource="apptacular_blog" >
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
 
	</cfquery> --->
<!---	<cfdump var="#getcomment#"><cfabort>--->
 <!---
 <cfoutput query="getcomment">
 

 <cfquery name="insert_tblblogentries" datasource="apptacular_blog" >

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

	</cfquery> 
 </cfoutput> --->
	 Done!