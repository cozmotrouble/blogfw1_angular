component {
	public any function default(struct rc) {
		
		rc.authorArray = entityLoad("author", {}, "authorID asc" );
		return rc;
	}

	 any function edit(struct rc)   {
	 	
	 	if (arguments.authorID == 0) {    
        	rc.authorArray = New ApptacularBlogFW1_New.cfc.author() ; 
        } else {        
         	rc.authorArray = entityLoad("author", arguments.authorID);
        } 
		 	return rc;
	}
	
	public any function update(struct rc) {
		
		author = EntityNew("author").populate(arguments) ;
		author.populate(arguments) ;
		author.setupdatedOn(createodBCDate(Now()));
		EntitySave(author);
		ORMFlush();
	}
	
	public any function delete(struct rc) {
		
		author = entityLoad("author", arguments.authorID);
		EntityDelete(author);
		ORMFlush();
	}
	
} 