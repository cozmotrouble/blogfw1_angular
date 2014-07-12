component {

	function init( fw ) {
	    variables.fw = fw;
	}
	public void function default(struct rc) {
		
		variables.fw.service( "author.default", "list" );
	}
	public void function edit(struct rc) {
		
		variables.fw.service( "author.edit", "edit" );
	}
	public void function update(struct rc) {
		
		variables.fw.service("author.update", "updateauthor" );
			//	writedump(variables.fw);
		
	}
	
	public void function delete(struct rc) {
		
		variables.fw.service("author.delete", "delete" );
			//	writedump(variables.fw);
		 
	}
	
 
	
} 