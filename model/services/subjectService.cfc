component persistent="false" mappedSuperClass="false"{


	/**
	* @hint A initialization routine, runs when object is created.
	*/
	public subjectService function init() output="false" {
		This.table = "subject";
		return This;
	}

	/**
	* @hint Returns the count of records in subject
	*/
	public numeric function count() output="false" {
		return ormExecuteQuery("select Count(*) from subject")[1];
	}

	/**
	* @hint Returns all of the records in subject.
	*/
	public subject[] function list() output="false" {
		return entityLoad("subject", {}, "subjectID asc");
	}

	/**
	* @hint Returns all of the records in subject, with paging.
	*/
	public subject[] function listPaged(numeric offset ="0" , numeric maxresults ="0" , string orderby ="subjectID asc" ) output="false" {
		var loadArgs = {};
		if (arguments.offset neq 0){
			loadArgs.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			loadArgs.maxresults = arguments.maxresults;
		}
		return entityLoad("subject", {}, arguments.orderby, loadArgs);
	}

	/**
	* @hint Returns one record from subject.
	*/
	public subject function get(required numeric id ) output="false" {
		return EntityLoad("subject", arguments.id, true);
	}

	/**
	* @hint Updates one record from subject.
	*/
	public void function update(required any subject ) output="false" {
		arguments.subject.nullifyZeroID();
		EntitySave(arguments.subject);
	}

	/**
	* @hint Deletes one record from subject.
	*/
	public void function destroy(required any subject ) output="false" {
		EntityDelete(arguments.subject);
	}

	/**
	* @hint Performs search against subject.
	*/
	public subject[] function search(string q ) output="false" {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM subject";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " name LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY subjectID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Performs search against subject., with paging.
	*/
	public subject[] function searchPaged(string q , numeric offset ="0" , numeric maxresults ="0" , string orderby ="subjectID asc" ) output="false" {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM subject";
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
		hqlString = hqlString & "FROM subject";
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