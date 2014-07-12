component {
	public any function default(struct rc) {
		
		rc.postArray = entityLoad("post", {}, "postID asc" );
		return rc;
	}

	 any function edit(struct rc)   {
	 	
	 	if (arguments.postID == 0) {    
        	rc.postArray = New ApptacularBlogFW1_New.cfc.post() ; 
        } else {        
         	rc.postArray = entityLoad("post", arguments.postID);
        } 
		 	return rc;
	}
	
	public any function update(struct rc) {
		
		post = EntityNew("post").populate(arguments) ;
		post.setupdatedOn(createodBCDate(Now()));
		EntitySave(post);
		ORMFlush();
	}
	
	public any function delete(struct rc) {
		
		post = entityLoad("post", arguments.postID);
		EntityDelete(post);
		ORMFlush();
	}
	
} 