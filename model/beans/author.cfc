
component persistent="true" mappedSuperClass="false"{

	property name="authorID" ormtype="integer" type="numeric" fieldtype="id" generator="native" column="authorID";
	property name="firstName" type="string";
	property name="lastName" type="string";
	property name="email" type="string";
	property name="createdOn" ormtype="timestamp" type="date"   ;
	property name="updatedOn" ormtype="timestamp" type="date"  ;
	property name="isEditor" ormtype="integer" type="numeric"   ;
	property name="dob" type="date";
 	property 	name="posts" 
				fieldtype="one-to-many" 
				cfc="Post" 
				fkcolumn="authorid" 
				type="array"
				
				singularname="post"; 
 
	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote author function init() output="false" {
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
	* @hint Returns the count of related (many to many) records in author
	*/
	public numeric function gettagCount() output="false" {
		var hql = "select author.tags.size as tagCount from author author where authorID = '#This.getauthorID()#'";
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
	public author function populate(required struct formStruct ) output="false" {
		if (StructKeyExists(arguments.formstruct, "authorID") AND arguments.formstruct.authorID gt 0){

			var item = EntityLoad("author", arguments.formstruct.authorID, true);

			if (not isNull(item)){
				This = item;
			}
			else{
				This.setauthorID(arguments.formstruct.authorID);
			}
		}

		if (StructKeyExists(arguments.formstruct, "firstName")){
			This.setfirstName(arguments.formstruct.firstName);
		}

		if (StructKeyExists(arguments.formstruct, "lastName")){
			This.setlastName(arguments.formstruct.lastName);
		}

		if (StructKeyExists(arguments.formstruct, "email")){
			This.setemail(arguments.formstruct.email);
		}

		if (StructKeyExists(arguments.formstruct, "isEditor")){
			This.setisEditor(arguments.formstruct.isEditor);
		}

		if (StructKeyExists(arguments.formstruct, "dob")){
			This.setdob(arguments.formstruct.dob);
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
		return This;
	}
}