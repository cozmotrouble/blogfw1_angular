component extends="org.corfield.framework" output="true"    {
	
	This.ormenabled = true;
	this.ormSettings.datasource= "apptacular_blog" ;
	This.sessionManagement = true;
 
	This.customTagPaths = GetDirectoryFromPath(GetCurrentTemplatePath()) & "customtags";
	//	This.ormsettings.eventHandler = "_MyBlog.cfc.eventHandler";
	This.ormsettings.logSQL = true;
	// Either put the org folder in your webroot or create a mapping for it!
	
	// FW/1 - configuration for introduction application:
	// controllers/layouts/services/views are in this folder (allowing for non-empty context root):
	variables.framework = {
		//base = getDirectoryFromPath( CGI.SCRIPT_NAME ).replace( getContextRoot(), '' ),
		suppressImplicitService = false,
		reloadApplicationOnEveryRequest = true
       // trace = true
 
	};
	
	 
		//if (structKeyExists(url, "reset_app")){
		//	ApplicationStop();
		//	location(cgi.script_name, false);
		//}

 	function setupApplication() 
	{
		//application.tard = "true";
			//setBeanFactory(createObject("component", "model.ObjectFactory").init(expandPath("./assets/config/beans.xml.cfm")));	
			
		 rc.offset = "-1";
	 	rc.maxresults = "-1";
		 
	}
 
 
 	// methods 
	public boolean function onApplicationStart(){
		return true;
	}
  

	public void function setupSession() {
	}

	public any function  setupRequest() output="true"    {
		rc.offset = "-1";
		rc.maxresults = "-1";
	 	application.ModelDotPath = "ApptacularBlogFW1_New.cfc";
		application.ServicesDotPath = "ApptacularBlogFW1_New.services";
		application.ControllersDotPath = "ApptacularBlogFW1_New.controllers";
	 
	/* writedump(fw);*/
	 return rc;
	
	}
 
 
}



 