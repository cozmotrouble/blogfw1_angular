component persistent="true" mappedSuperClass="false"{

	property name="postID" ormtype="integer" type="numeric" fieldtype="id" generator="native" ;
	property name="author" column="authorID" fieldtype="many-to-one" cfc="author" fkColumn="authorID"   inverse="true"  remotingFetch="true"    ;
	property name="title" type="string";
	property name="body" ormtype="text" type="string";
	property name="createdOn" type="date";
	property name="updatedOn" type="date";
	property name="comments" fieldtype="one-to-many" cfc="comment" fkColumn="postID" missingRowIgnored="true" inverse="true" cascade="all-delete-orphan" SingularName="comment" orderby="commentID asc" remotingFetch="true";
	property name="subjects" fieldtype="many-to-many" cfc="subject" fkColumn="postID" missingRowIgnored="true" inverse="true" SingularName="subject" linktable="subjecttopost" InverseJoinColumn="subjectID" orderby="subjectID asc" remotingFetch="false";
	property name="tags" fieldtype="many-to-many" cfc="tag" fkColumn="postID" missingRowIgnored="true" inverse="true" SingularName="tag" linktable="tagtopost" InverseJoinColumn="tagID" orderby="tagid asc" remotingFetch="false";

	/**
	* @hint A initialization routine, runs when object is created.
	*/
	public post function init() output="false" {
		return This;
	}

	/**
	* @hint Returns the count of related (one to many) records in comment
	*/
	public numeric function getcommentCount() output="false" {
		var hql = "select comments.size from post post where post.postID = '#This.getpostID()#'";
		var result = ormExecuteQuery(hql)[1];
		return result;
	}

	/**
	* @hint Returns the count of related (many to many) records in post
	*/
	public numeric function getsubjectCount() output="false" {
		var hql = "select post.subjects.size as subjectCount from post post where postID = '#This.getpostID()#'";
		var result = ormExecuteQuery(hql)[1];
		return result;
	}

	/**
	* @hint Returns the count of related (many to many) records in post
	*/
	public numeric function gettagCount() output="false" {
		var hql = "select post.tags.size as tagCount from post post where postID = '#This.getpostID()#'";
		var result = ormExecuteQuery(hql)[1];
		return result;
	}

	/**
	* @hint Nullifies blank or zero id's.  Useful for dealing with objects coming back from remoting.
	*/
	public void function nullifyZeroID() output="false" {
		if (getpostID() eq 0 OR getpostID() eq ""){
			setpostID(JavaCast("Null", ""));
		}
	}

	/**
	* @hint Populates the content of the object from a form structure.
	*/
	public post function populate(required struct formStruct ) output="false" {
		if (StructKeyExists(arguments.formstruct, "postID") AND arguments.formstruct.postID gt 0){

			var item = EntityLoad("post", arguments.formstruct.postID, true);

			if (not isNull(item)){
				This = item;
			}
			else{
				This.setpostID(arguments.formstruct.postID);
			}
		}

		if (StructKeyExists(arguments.formstruct, "title")){
			This.settitle(arguments.formstruct.title);
		}

		if (StructKeyExists(arguments.formstruct, "body")){
			This.setbody(arguments.formstruct.body);
		}

		if (StructKeyExists(arguments.formstruct, "author")){
			author = entityLoad("author", arguments.formStruct.author, true);
			This.setauthor(author);
		}


		//Handle many-to-many relationships for table tag
		if (structKeyExists(arguments.formstruct, "tags")){
			This.settags([]);
			if (ListLen(arguments.formstruct.tags) gt 0){
				for (i = 1; i <= ListLen(arguments.formstruct.tags); i++ ){
					var id = ListGetAt(arguments.formstruct.tags, i);
					var tag = entityLoad("tag", id, true);
					This.addtag(tag);
				}
			}
		}

		//Handle many-to-many relationships for table subject
		if (structKeyExists(arguments.formstruct, "subjects")){
			This.setsubjects([]);
			if (ListLen(arguments.formstruct.subjects) gt 0){
				for (i = 1; i <= ListLen(arguments.formstruct.subjects); i++ ){
					var id = ListGetAt(arguments.formstruct.subjects, i);
					var subject = entityLoad("subject", id, true);
					This.addsubject(subject);
				}
			}
		}
		return This;
	}
}