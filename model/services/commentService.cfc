
component persistent="false" mappedSuperClass="false"{


	/**
	* @hint A initialization routine, runs when object is created.
	*/
	public commentService function init() output="false" {
		This.table = "comment";
		return This;
	}

	/**
	* @hint Returns the count of records in comment
	*/
	public numeric function count() output="false" {
		return ormExecuteQuery("select Count(*) from comment")[1];
	}

	/**
	* @hint Returns all of the records in comment.
	*/
	public comment[] function list() output="false" {
		return entityLoad("comment", {}, "commentID asc");
	}

	/**
	* @hint Returns all of the records in comment, with paging.
	*/
	public comment[] function listPaged(numeric offset ="0" , numeric maxresults ="0" , string orderby ="commentID asc" ) output="false" {
		var loadArgs = {};
		if (arguments.offset neq 0){
			loadArgs.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			loadArgs.maxresults = arguments.maxresults;
		}
		return entityLoad("comment", {}, arguments.orderby, loadArgs);
	}

	/**
	* @hint Returns one record from comment.
	*/
	public comment function get(required numeric id ) output="false" {
		return EntityLoad("comment", arguments.id, true);
	}

	/**
	* @hint Updates one record from comment.
	*/
	public void function update(required any comment ) output="false" {
		//arguments.comment.nullifyZeroID();
		EntitySave(arguments.comment);
	}

	/**
	* @hint Deletes one record from comment.
	*/
	public void function destroy(required any comment ) output="false" {
		EntityDelete(arguments.comment);
	}

	/**
	* @hint Performs search against comment.
	*/
	public comment[] function search(string q ) output="false" {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM comment";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " name LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " email LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " website LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY commentID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Performs search against comment., with paging.
	*/
	public comment[] function searchPaged(string q , numeric offset ="0" , numeric maxresults ="0" , string orderby ="commentID asc" ) output="false" {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM comment";
		if (arguments.offset neq 0){
			params.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			params.maxresults = arguments.maxresults;
		}
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " name LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " email LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " website LIKE '%#arguments.q#%'", "|");
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
	public numeric function searchCount(string q ) output="false" {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "SELECT count(*) ";
		hqlString = hqlString & "FROM comment";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " name LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " email LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " website LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		return ormExecuteQuery(hqlString, false, params)[1];
	}
}