component persistent="false" mappedSuperClass="false"{


	/**
	* @hint A initialization routine, runs when object is created.
	*/
	public authorService function init() output="false" {
		This.table = "author";
		return This;
	}

	/**
	* @hint Returns the count of records in author
	*/
	public numeric function count() output="false" {
		return ormExecuteQuery("select Count(*) from author")[1];
	}

	/**
	* @hint Returns all of the records in author.
	*/
	public author[] function list() output="false" {
		return entityLoad("author", {}, "authorID asc");
	}

	/**
	* @hint Returns all of the records in author, with paging.
	*/
	public author[] function listPaged(numeric offset ="0" , numeric maxresults ="0" , string orderby ="authorID asc" ) output="false" {
		var loadArgs = {};
		if (arguments.offset neq 0){
			loadArgs.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			loadArgs.maxresults = arguments.maxresults;
		}
		return entityLoad("author", {}, arguments.orderby, loadArgs);
	}

	/**
	* @hint Returns one record from author.
	*/
	public author function get(required numeric id ) output="false" {
		return EntityLoad("author", arguments.id, true);
	}

	/**
	* @hint Updates one record from author.
	*/
	public void function update(required any author ) output="false" {
		arguments.author.nullifyZeroID();
		EntitySave(arguments.author);
	}

	/**
	* @hint Deletes one record from author.
	*/
	public void function destroy(required any author ) output="false" {
		EntityDelete(arguments.author);
	}

	/**
	* @hint Performs search against author.
	*/
	public author[] function search(string q ) output="false" {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM author";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " firstName LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " lastName LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " email LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY authorID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Performs search against author., with paging.
	*/
	public author[] function searchPaged(string q , numeric offset ="0" , numeric maxresults ="0" , string orderby ="authorID asc" ) output="false" {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM author";
		if (arguments.offset neq 0){
			params.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			params.maxresults = arguments.maxresults;
		}
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " firstName LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " lastName LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " email LIKE '%#arguments.q#%'", "|");
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
		hqlString = hqlString & "FROM author";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " firstName LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " lastName LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " email LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		return ormExecuteQuery(hqlString, false, params)[1];
	}
}