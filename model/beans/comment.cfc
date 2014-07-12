/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component persistent="true" mappedSuperClass="false"{

	property name="commentID" ormtype="integer" type="numeric" fieldtype="id" generator="native" ;
	 property name="post" column="postID" fieldtype="many-to-one" cfc="post" fkColumn="postID" missingRowIgnored="true"  remotingFetch="false";
	property name="body" ormtype="text" type="string"  ;
	property name="name" type="string" ;
	property name="email" type="string" ;
	property name="website" type="string"  ;
	property name="createdOn" ormtype="timestamp" type="date"  ;
	property name="updatedOn" ormtype="timestamp" type="date" ;

	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote comment function init() output="false" {
		return This;
	}

	/**
	* @hint Nullifies blank or zero id's.  Useful for dealing with objects coming back from remoting.
	*/
	public void function nullifyZeroID() output="false" {
		if (getcommentID() eq 0 OR getcommentID() eq ""){
			setcommentID(JavaCast("Null", ""));
		}
	}

	/**
	* @hint Populates the content of the object from a form structure.
	*/
	public comment function populate(required struct formStruct ) output="false" {
		if (StructKeyExists(arguments.formstruct, "commentID") AND arguments.formstruct.commentID gt 0){

			var item = EntityLoad("comment", arguments.formstruct.commentID, true);

			if (not isNull(item)){
				This = item;
			}
			else{
				This.setcommentID(arguments.formstruct.commentID);
			}
		}

		if (StructKeyExists(arguments.formstruct, "post")){
			post = entityLoad("post", arguments.formStruct.post, true);
			This.setpost(post);
		}

		if (StructKeyExists(arguments.formstruct, "body")){
			This.setbody(arguments.formstruct.body);
		}

		if (StructKeyExists(arguments.formstruct, "name")){
			This.setname(arguments.formstruct.name);
		}

		if (StructKeyExists(arguments.formstruct, "email")){
			This.setemail(arguments.formstruct.email);
		}

		if (StructKeyExists(arguments.formstruct, "website")){
			This.setwebsite(arguments.formstruct.website);
		}
		if (StructKeyExists(arguments.formstruct, "createdOn")){
			This.setcreatedOn(arguments.formstruct.createdOn);
		}
		if (StructKeyExists(arguments.formstruct, "updatedOn")){
			This.setupdatedOn(arguments.formstruct.updatedOn);
		}

		return This;
	}
}