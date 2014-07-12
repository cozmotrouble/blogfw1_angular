component extends="org.corfield.framework" {
	
	This.name = "FW1_blog#createuUID()#ssasssds";
	This.ormenabled = true;
	This.datasource = "apptacular_blog" ;
	This.customTagPaths = GetDirectoryFromPath(GetCurrentTemplatePath()) & "customtags";
	This.ormsettings.dbcreate = "update";
	This.ormsettings.logSQL = true;
    //this.welcomefilelist
	 
	
		variables.framework = {
		// the name of the URL variable:
		action = 'action',
		// the URL variable to reload the controller/service cache:
		reload = 'reload',
		// the value of the reload variable that authorizes the reload:
		password = 'true',
		// debugging flag to force reload of cache on each request:
		reloadApplicationOnEveryRequest = false,
		// whether to force generation of SES URLs:
		generateSES = false,
		// whether to omit /index.cfm in SES URLs:
		SESOmitIndex = false,
		// location used to find layouts / views:
 
		// list of file extensions that FW/1 should not handle:
		unhandledExtensions = 'cfc',
		// list of (partial) paths that FW/1 should not handle:
		// flash scope magic key and how many concurrent requests are supported:
		preserveKeyURLKey = 'fw1pk',
		maxNumContextsPreserved = 50,
		// set this to true to cache the results of fileExists for performance:
		cacheFileExists = true,
		// change this if you need multiple FW/1 applications in a single CFML application:
		applicationKey = 'org.corfield.framework'
	};
	
	
	
/*	
	function onApplicationStart(){
		
	}*/
	 
	function setupRequest() {
		// use setupRequest to do initialization per request
		request.context.startTime = getTickCount();
		//var bf = new org.corfield.ioc( "model" );
		//var beanFactory = new _BlogFW1_Angular.org.corfield.ioc( "model" );
		//application.beanFactory =beanFactory;
		//setBeanFactory( bf );
		setting showdebugoutput="false";
	//	onApplicationStart();
	 	//ORMReload();
	}

    function setupApplication() {
        // bean factory should look in the model tree for services and beans
   		//request.context.startTime = getTickCount();
		// var bf = new org.corfield.ioc( "model" );
		var beanFactory = new _BlogFW1_Angular.org.corfield.ioc( "model" );
		application.beanFactory =beanFactory;
        setBeanFactory( beanFactory );
    }
	
}
