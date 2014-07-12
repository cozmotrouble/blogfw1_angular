<cfcomponent>

	<cffunction name="init" access="public" returntype="this" output="true" >
		
		<cfreturn this>

	</cffunction>


<cfscript>
	/**
	* @hint Populates the content of the object from a form structure.
	*/
	public author function populate(required struct formStruct ) output="true" {
		if (StructKeyExists(arguments.formstruct, "authorID") AND arguments.formstruct.authorID > 0){
			This = EntityLoad("author", 1, true);
			this.getfirstName();
			/*	writedump("arguments.formstruct.authorIDx  = #arguments.formstruct.authorID#"); 
				writedump(this); */
		}
	 	
		if (StructKeyExists(arguments.formstruct, "firstName")){
			this.setfirstName(arguments.formstruct.firstName);
		}
		if (StructKeyExists(arguments.formstruct, "lastName")){
			this.setlastName(arguments.formstruct.lastName);
		}
		if (StructKeyExists(arguments.formstruct, "email")){
			this.setemail(arguments.formstruct.email);
		}
		if (StructKeyExists(arguments.formstruct, "isEditor")){
			this.setisEditor(arguments.formstruct.isEditor);
		}
		if (StructKeyExists(arguments.formstruct, "dob")){
			this.setdob(arguments.formstruct.dob);
		}
		/*	
	 		writedump(this); */
	 		/*abort;	
			throw("#arguments.formstruct.authorID# asdasd ","error","#arguments.formstruct.authorID# asdasd ");
			*/
					 
		return This;
	}	
</cfscript>




</cfcomponent>