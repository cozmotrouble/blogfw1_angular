component persistent="true" table="tag"   entityName="tag"{

	property name="tagid" column="tagid" ormtype="string" type="string" fieldtype="id" generator="native" missingRowIgnored="true" length="19" inverse="true" ;
	property name="name" column="name" ormtype="string" type="string" missingRowIgnored="true" length="255" inverse="true" ;
	property name="createdOn" column="createdOn" ormtype="string" type="string" missingRowIgnored="true" length="19"  ;
	property name="updatedOn" column="updatedOn" ormtype="string" type="string" missingRowIgnored="true" length="19"  ;
 	property 	name="posts" 
				fieldtype="many-to-many" 
				cfc="post" 
				fkColumn="tagID" 
				missingRowIgnored="true" 
				inverse="true"
				lazy="false"
				SingularName="post" 
				linktable="tagtopost" 
				InverseJoinColumn="postID" 
				orderby="postID asc" ;
 
	/**
	* @hint A initialization routine, runs when object is created.
	*/
	public tag function init() output="false" {
		return This;
	}

	/**
	* @hint Returns the count of related (many to many) records in tag
	*/
/*	public numeric function gettagCount() output="false" {
		var hql = "select tag.tags.size as tagCount from tag tag where tagid = '#This.gettagid()#'";
		var result = ormExecuteQuery(hql)[1];
		return result;
	}*/

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
		if (StructKeyExists(arguments.formstruct, "tagid") AND arguments.formstruct.tagid > 0){
			This = EntityLoad("tag", arguments.formstruct.tagid, true);
		}
		if (StructKeyExists(arguments.formstruct, "name")){
			this.setname(arguments.formstruct.name);
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