component persistent="false" mappedSuperClass="false"{


	/**
	* @hint A initialization routine, runs when object is created.
	*/
	public tagService function init() output="false" {
		This.table = "tag";
		return This;
	}

	/**
	* @hint Returns the count of records in tag
	*/
	public numeric function count() output="false" {
		return ormExecuteQuery("select Count(*) from tag")[1];
	}

	/**
	* @hint Returns all of the records in tag.
	*/
	public tag[] function list() output="false" {
		return entityLoad("tag", {}, "tagid asc");
	}

	/**
	* @hint Returns all of the records in tag, with paging.
	*/
	public tag[] function listPaged(numeric offset ="0" , numeric maxresults ="0" , string orderby ="tagid asc" ) output="false" {
		var loadArgs = {};
		if (arguments.offset neq 0){
			loadArgs.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			loadArgs.maxresults = arguments.maxresults;
		}
		return entityLoad("tag", {}, arguments.orderby, loadArgs);
	}

	/**
	* @hint Returns one record from tag.
	*/
	public tag function get(required numeric id ) output="false" {
		return EntityLoad("tag", arguments.id, true);
	}

	/**
	* @hint Updates one record from tag.
	*/
	public void function update(required any tag ) output="false" {
		arguments.tag.nullifyZeroID();
		EntitySave(arguments.tag);
	}

	/**
	* @hint Deletes one record from tag.
	*/
	public void function destroy(required any tag ) output="false" {
		EntityDelete(arguments.tag);
	}

	/**
	* @hint Performs search against tag.
	*/
	public tag[] function search(string q ) output="false" {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM tag";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " name LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY tagid asc";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Performs search against tag., with paging.
	*/
	public tag[] function searchPaged(string q , numeric offset ="0" , numeric maxresults ="0" , string orderby ="tagid asc" ) output="false" {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM tag";
		if (arguments.offset neq 0){
			params.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			params.maxresults = arguments.maxresults;
		}
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " name LIKE '%#arguments.q#%'", "|");
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
		hqlString = hqlString & "FROM tag";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " name LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		return ormExecuteQuery(hqlString, false, params)[1];
	}
}