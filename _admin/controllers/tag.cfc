component {

	function init( fw ) {
	    variables.fw = fw;
	}
	public void function default(struct rc) {
		
		variables.fw.service( "tag.default", "list" );
	}
	public void function edit(struct rc) {
		
		variables.fw.service( "tag.edit", "edit" );
	}
	public void function update(struct rc) {
		
		variables.fw.service("tag.update", "updatetag" );
			//	writedump(variables.fw);
		
	}
	
	public void function delete(struct rc) {
		
		variables.fw.service("tag.delete", "deletetag" );
			//	writedump(variables.fw);
		 
	}
	
} 