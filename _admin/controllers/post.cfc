component output="true"   {

	function init( fw ) {
	    variables.fw = fw;
	}
	public void function default(struct rc) {
		
		variables.fw.service( "post.default", "list" );
	}
	public void function edit(struct rc) {
		
		variables.fw.service( "post.edit", "edit" );
		
	}
	public void function update(struct rc) output="true"   {
		writeDump(arguments.rc);
		variables.fw.service("post.update", "updatepost" );
			//	writedump(variables.fw);
		
	}
	
	public void function delete(struct rc) {
		
		variables.fw.service("post.delete", "deletepost" );
			//	writedump(variables.fw);
		 
	}
	
 
	
} 