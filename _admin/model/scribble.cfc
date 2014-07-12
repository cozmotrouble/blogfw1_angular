component persistent="true" table="author" entityName="author232"{

	property name="authorID" column="authorID" ormtype="string" type="string" fieldtype="id" generator="native" length="19" ;
	property name="firstName" column="firstName" ormtype="string" type="string" length="255" ;
	property name="lastName" column="lastName" ormtype="string" type="string" length="255" ;
	property name="email" column="email" ormtype="string" type="string" length="255" ;
	property name="createdOn" column="createdOn" ormtype="date" type="date" length="19" ;
	property name="updatedOn" column="updatedOn" ormtype="date" type="date" length="19" ;
	property name="isEditor" column="isEditor" ormtype="integer" type="numeric" length="5" ;
	property name="dob" column="dob" ormtype="date" type="date" length="10" ;
	property name="posts" fieldtype="one-to-many" cfc="post" fkColumn="authorID" cascade="all-delete-orphan" SingularName="post" orderby="postID asc" ;

	/**
	* @hint A initialization routine, runs when object is created.
	*/
	public author function init() {
		return This;
	}

	/**
	* @hint Populates the content of the object from a form structure.
	*/
	public author function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "authorID") AND arguments.formstruct.authorID > 0){
			var myauthor = EntityLoad("author", 1, true);
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
		return myauthor;
	}
}