component   {
	
	This.name = "FW1_blog#createuUID()#ssaswddddssds";
	This.ormenabled = true;
	This.datasource = "apptacular_blog" ;
	This.customTagPaths = GetDirectoryFromPath(GetCurrentTemplatePath()) & "customtags";
	This.ormsettings.dbcreate = "update";
	This.ormsettings.logSQL = true;
    //this.welcomefilelist
	 
	function onApplicationStart(){
		
	}
	 function onRequestStart(required string targetPage ) output="false" {
	 	        // bean factory should look in the model tree for services and beans
        application.BeanFactory = new org.corfield.ioc( "model" );
        
	 	
	 	  return true; 
	 }
 
 
	function setupRequest() {
		// use setupRequest to do initialization per request
		request.context.startTime = getTickCount();
		setting showdebugoutput="false";
		/* var bf = new org.corfield.ioc( "model" );
        setBeanFactory( bf )*/;
		 onApplicationStart();
	 	ORMReload();
	}

    function setupApplication() {
        // bean factory should look in the model tree for services and beans
        var bf = new org.corfield.ioc( "model" );
        setBeanFactory( bf );
    }
	
}
