component persistent="true" mappedSuperClass="false"{

	property name="tagid" ormtype="integer" type="numeric" fieldtype="id" generator="native" ;
	property name="name" type="string";
	property name="createdOn" ormtype="timestamp" type="date" ;
	property name="updatedOn" ormtype="timestamp" type="date"  ;
	property name="authors" fieldtype="many-to-many" cfc="author" fkColumn="tagID"   SingularName="author" linktable="tagtoauthor" InverseJoinColumn="authorID" orderby="authorID asc" ;
	property name="posts" fieldtype="many-to-many" cfc="post" fkColumn="tagID" missingRowIgnored="true" SingularName="post" 
	linktable="tagtopost" InverseJoinColumn="postID" orderby="postID asc" ;

	/**
	* @hint A initialization routine, runs when object is created.
	*/
	public tag function init() output="false" {
		return This;
	}

	/**
	* @hint Returns the count of related (many to many) records in tag
	*/
	public numeric function getauthorCount() output="false" {
		var hql = "select tag.authors.size as authorCount from tag tag where tagid = '#This.gettagid()#'";
		var result = ormExecuteQuery(hql)[1];
		return result;
	}

	/**
	* @hint Returns the count of related (many to many) records in tag
	*/
	public numeric function getpostCount() output="false" {
		var hql = "select tag.posts.size as postCount from tag tag where tagid = '#This.gettagid()#'";
		var result = ormExecuteQuery(hql)[1];
		return result;
	}

	/**
	* @hint Nullifies blank or zero id's.  Useful for dealing with objects coming back from remoting.
	*/
	public void function nullifyZeroID() output="false" {
		if (gettagid() eq 0 OR gettagid() eq ""){
			settagid(JavaCast("Null", ""));
		}
	}

	/**
	* @hint Populates the content of the object from a form structure.
	*/
	public tag function populate(required struct formStruct ) output="false" {
		if (StructKeyExists(arguments.formstruct, "tagid") AND arguments.formstruct.tagid gt 0){

			var item = EntityLoad("tag", arguments.formstruct.tagid, true);

			if (not isNull(item)){
				This = item;
			}
			else{
				This.settagid(arguments.formstruct.tagid);
			}
		}

		if (StructKeyExists(arguments.formstruct, "name")){
			This.setname(arguments.formstruct.name);
		}


		//Handle many-to-many relationships for table author
		if (structKeyExists(arguments.formstruct, "authors")){
			This.setauthors([]);
			if (ListLen(arguments.formstruct.authors) gt 0){
				for (i = 1; i <= ListLen(arguments.formstruct.authors); i++ ){
					var id = ListGetAt(arguments.formstruct.authors, i);
					var author = entityLoad("author", id, true);
					This.addauthor(author);
				}
			}
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