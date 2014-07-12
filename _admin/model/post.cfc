component persistent="true" table="post"  entityName="post" lazy="false"   {

	property name="postID" column="postID" ormtype="string" type="string" fieldtype="id" generator="native" missingRowIgnored="true" length="19"  ;
	property name="title" column="title" ormtype="string" type="string" missingRowIgnored="true" length="255"   ;
	property name="body" column="body" ormtype="string" type="string" missingRowIgnored="true" length="2147483647"  ;
	property name="createdOn" column="createdOn" ormtype="date" type="date"  missingRowIgnored="true" length="19"   ;
	property name="updatedOn" column="updatedOn" ormtype="date" type="date"  missingRowIgnored="true" length="19"  ;
	property 	name="author" 
				column="authorID" 
				fieldtype="many-to-one" 
				cfc="author" 
				lazy="false"
				fkColumn="authorID" 
				missingRowIgnored="false" 
				length="19" 
				inverse="true" ;
				
	property 	name="comments" 
				fieldtype="one-to-many" 
				cfc="comment"
				fkColumn="postID" 
				missingRowIgnored="true" 
				inverse="false" 
				lazy="false"
				cascade="all-delete-orphan" 
				SingularName="comment" 
				orderby="commentID asc" ;

	property 	name="tags" 
				fieldtype="many-to-many" 
				cfc="tag" 
				type="array"   
				SingularName="tag" 
				fkColumn="postID"  
				lazy="false"         
				InverseJoinColumn="tagID" 
				linktable="tagtopost"  
				orderby="name asc" ;
	/**
		
			property name="accounts" fieldType="many-to-many" CFC="Account" linkTable="XRef_AccountRoleXPerson" fkColumn="accountRoleID" 
			inverseJoinColumn="accountID" lazy=false;

		property name="discounts" fieldType="one-to-many" CFC="Discount" fkColumn="accountID" lazy=false;
	
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
		if (StructKeyExists(arguments.formstruct, "postID") AND arguments.formstruct.postID > 0){
			This = EntityLoad("post", arguments.formstruct.postID, true);
		}
		if (StructKeyExists(arguments.formstruct, "title")){
			this.settitle(arguments.formstruct.title);
		}
		if (StructKeyExists(arguments.formstruct, "body")){
			this.setbody(arguments.formstruct.body);
		}
		author = entityLoad("author", form.author, true);
		This.setauthor(author);

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
		return This;
	}

}