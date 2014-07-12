/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component persistent="false" mappedSuperClass="false"{


	/**
	* @hint A initialization routine, runs when object is created.
	*/
	public postService function init() output="false" {
		This.table = "post";
		return This;
	}

	/**
	* @hint Returns the count of records in post
	*/
	remote numeric function count() output="false" returnformat="JSON"   {
		return ormExecuteQuery("select Count(*) from post")[1];
	}

	/**
	* @hint Returns all of the records in post.
	*/
	remote any function list() output="false" returnformat="JSON"    {
		return entityLoad("post", {}, "postID asc");
	}

	/**
	* @hint Returns all of the records in post, with paging.
	*/
	remote post[] function listPaged(numeric offset ="0" , numeric maxresults ="0" , string orderby ="postID asc" ) output="false" returnformat="JSON" {
		var loadArgs = {};
		if (arguments.offset neq 0){
			loadArgs.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			loadArgs.maxresults = arguments.maxresults;
		}
		return entityLoad("post", {}, arguments.orderby, loadArgs);
	}

	/**
	* @hint Returns one record from post.
	*/
	remote post function get(required numeric id ) output="false" returnformat="JSON" {
		return EntityLoad("post", arguments.id, true);
	}

	/**
	* @hint Updates one record from post.
	*/
	public void function update(required any post ) output="false" {
		arguments.post.nullifyZeroID();
		EntitySave(arguments.post);
	}

	/**
	* @hint Deletes one record from post.
	*/
	public void function destroy(required any post ) output="false" {
		EntityDelete(arguments.post);
	}

	/**
	* @hint Performs search against post.
	*/
	remote post[] function search(string q ) output="false" returnformat="JSON" {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM post";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " title LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY postID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Performs search against post., with paging.
	*/
	remote post[] function searchPaged(	string q ,
										numeric offset ="0" , 
										numeric maxresults ="0" , 
										string orderby ="postID asc" ) output="false" returnformat="JSON"{

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM post";
		if (arguments.offset neq 0){
			params.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			params.maxresults = arguments.maxresults;
		}
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " title LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY #arguments.orderby#";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Determines total number of results of search for paging purposes.
	*/
	remote numeric function searchCount(string q ) output="false" returnformat="JSON" {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "SELECT count(*) ";
		hqlString = hqlString & "FROM post";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " title LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		return ormExecuteQuery(hqlString, false, params)[1];
	}
}