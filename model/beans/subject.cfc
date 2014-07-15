component persistent="true" mappedSuperClass="false"{

	property name="subjectID" ormtype="integer" type="numeric" fieldtype="id" generator="native";
	property name="name" type="string";
	property name="createdOn" ormtype="timestamp" type="date";
	property name="updatedOn" ormtype="timestamp" type="date";
	property name="posts" fieldtype="many-to-many" cfc="post" fkColumn="subjectID" SingularName="post" linktable="subjecttopost" InverseJoinColumn="postID"  ;

	/**
	* @hint A initialization routine, runs when object is created.
	*/
	public subject function init() output="false" {
		return This;
	}

	/**
	* @hint Returns the count of related (many to many) records in subject
	*/
	public numeric function getpostCount() output="false" {
		var hql = "select subject.posts.size as postCount from subject subject where subjectID = '#This.getsubjectID()#'";
		var result = ormExecuteQuery(hql)[1];
		return result;
	}

	/**
	* @hint Nullifies blank or zero id's.  Useful for dealing with objects coming back from remoting.
	*/
	public void function nullifyZeroID() output="false" {
		if (getsubjectID() eq 0 OR getsubjectID() eq ""){
			setsubjectID(JavaCast("Null", ""));
		}
	}

	/**
	* @hint Populates the content of the object from a form structure.
	*/
	public subject function populate(required struct formStruct ) output="false" {
		if (StructKeyExists(arguments.formstruct, "subjectID") AND arguments.formstruct.subjectID gt 0){

			var item = EntityLoad("subject", arguments.formstruct.subjectID, true);

			if (not isNull(item)){
				This = item;
			}
			else{
				This.setsubjectID(arguments.formstruct.subjectID);
			}
		}

		if (StructKeyExists(arguments.formstruct, "name")){
			This.setname(arguments.formstruct.name);
		}


		//Handle many-to-many relationships for table post
		if (structKeyExists(arguments.formstruct, "posts")){
			This.setposts([]);
			if (ListLen(arguments.formstruct.posts) gt 0){
				for (i = 1; i <= ListLen(arguments.formstruct.posts); i++ ){
					var id = ListGetAt(arguments.formstruct.posts, i);
					var post = entityLoad("post", id, true);
					This.addpost(post);
				}
			}
		}
		return This;
	}
}