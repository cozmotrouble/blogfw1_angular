component persistent="true" table="author" output="true"  entityName="author"{

	property name="authorID" column="authorID" ormtype="string" type="string" fieldtype="id" generator="native" missingRowIgnored="true" length="19"  ;
	property name="firstName" column="firstName" ormtype="string" type="string" missingRowIgnored="true" length="255"  ;
	property name="lastName" column="lastName" ormtype="string" type="string" missingRowIgnored="true" length="255"  ;
	property name="email" column="email" ormtype="string" type="string" missingRowIgnored="true" length="255"  ;
	property name="createdOn" column="createdOn" ormtype="date" type="date" missingRowIgnored="true" length="19"  ;
	property name="updatedOn" column="updatedOn" ormtype="date" type="date" missingRowIgnored="true" length="19"  ;
	property name="isEditor" column="isEditor" ormtype="integer" type="numeric" missingRowIgnored="true" length="5"  ;
	property name="dob" column="dob" ormtype="date" type="date" missingRowIgnored="true" length="10"  ;
	property 	name="posts" 
				fieldtype="one-to-many" 
				cfc="post" 
				fkColumn="authorID" 
				missingRowIgnored="true"
				cascade="all-delete-orphan" 
				SingularName="post" 
		
				orderby="postID asc" ;

	/**
	* @hint A initialization routine, runs when object is created.
	*/
	public author function init() output="false" {
		return This;
	}

	/**
	* @hint Returns the count of related (one to many) records in post
	*/
	public numeric function getpostCount() output="false" {
		var hql = "select posts.size from author author where author.authorID = '#This.getauthorID()#'";
		var result = ormExecuteQuery(hql)[1];
		return result;
	}

	/**
	* @hint Nullifies blank or zero id's.  Useful for dealing with objects coming back from remoting.
	*/
	public void function nullifyZeroID() output="false" {
		if (getauthorID() eq 0 OR getauthorID() eq ""){
			setauthorID(JavaCast("Null", ""));
		}
	}

	/**
	* @hint Populates the content of the object from a form structure.
	*/
	public author function populate(required struct formStruct ) output="true" {
		if (StructKeyExists(arguments.formstruct, "authorID") AND arguments.formstruct.authorID > 0){
			var myauthor = EntityLoad("author", 1, true);
			myauthor.getfirstName();
			/*	writedump("arguments.formstruct.authorIDx  = #arguments.formstruct.authorID#"); 
				writedump(myauthor); */
		}
	 	
		if (StructKeyExists(arguments.formstruct, "firstName")){
			myauthor.setfirstName(arguments.formstruct.firstName);
		}
		if (StructKeyExists(arguments.formstruct, "lastName")){
			myauthor.setlastName(arguments.formstruct.lastName);
		}
		if (StructKeyExists(arguments.formstruct, "email")){
			myauthor.setemail(arguments.formstruct.email);
		}
		if (StructKeyExists(arguments.formstruct, "isEditor")){
			myauthor.setisEditor(arguments.formstruct.isEditor);
		}
		if (StructKeyExists(arguments.formstruct, "dob")){
			myauthor.setdob(arguments.formstruct.dob);
		}
		/*	
	 		writedump(myauthor); */
	 		/*abort;	
			throw("#arguments.formstruct.authorID# asdasd ","error","#arguments.formstruct.authorID# asdasd ");
			*/
					 
		return myauthor;
	}

}