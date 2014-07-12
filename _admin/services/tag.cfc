component {
	public any function default(struct rc) {
		
		rc.tagArray = entityLoad("tag", {}, "tagID asc" );
		return rc;
	}

	 any function edit(struct rc)   {
	 	
	 	if (arguments.tagID == 0) {    
        	rc.tagArray = New ApptacularBlogFW1_New.cfc.tag() ; 
        } else {        
         	rc.tagArray = entityLoad("tag", arguments.tagID);
        } 
		 	return rc;
	}
	
	public any function update(struct rc) {
		
		tag = EntityNew("tag").populate(arguments) ;
		tag.populate(arguments) ;
		tag.setupdatedOn(createodBCDate(Now()));
		EntitySave(tag);
		ORMFlush();
	}
	
	public any function delete(struct rc) {
		
		tag = entityLoad("tag", arguments.tagID);
		EntityDelete(tag);
		ORMFlush();
	}
	
} 