component persistent="true" table="comment"   entityName="comment"{

	property name="commentID" column="commentID" ormtype="string" type="string" fieldtype="id" generator="native" missingRowIgnored="true" length="19";
	property name="body" column="body" ormtype="string" type="string" missingRowIgnored="true" length="2147483647";
	property name="name" column="name" ormtype="string" type="string" missingRowIgnored="true" length="255";
	property name="email" column="email" ormtype="string" type="string" missingRowIgnored="true" length="255" ;
	property name="website" column="website" ormtype="string" type="string" missingRowIgnored="true" length="255" inverse="true" ;
	property name="createdOn" column="createdOn" ormtype="date" type="date" missingRowIgnored="true" length="19";
	property name="updatedOn" column="updatedOn" ormtype="date" type="date" missingRowIgnored="true" length="19";
	property name="post" column="postID" fieldtype="many-to-one" cfc="post" fkColumn="postID" missingRowIgnored="true" length="19" inverse="true" lazy="false"  ;

	/**
	* @hint A initialization routine, runs when object is created.
	*/
	public comment function init() output="false" {
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
		if (StructKeyExists(arguments.formstruct, "commentID") AND arguments.formstruct.commentID > 0){
			This = EntityLoad("comment", arguments.formstruct.commentID, true);
		}
		post = entityLoad("post", form.post, true);
		This.setpost(post);
		if (StructKeyExists(arguments.formstruct, "body")){
			this.setbody(arguments.formstruct.body);
		}
		if (StructKeyExists(arguments.formstruct, "name")){
			this.setname(arguments.formstruct.name);
		}
		if (StructKeyExists(arguments.formstruct, "email")){
			this.setemail(arguments.formstruct.email);
		}
		if (StructKeyExists(arguments.formstruct, "website")){
			this.setwebsite(arguments.formstruct.website);
		}
		return This;
	}

}