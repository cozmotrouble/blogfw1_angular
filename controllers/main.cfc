component accessors="true" {

    property beanFactory;
    property formatterService;
	
	remote any function init( fw ) {
		variables.fw = fw;
		return this;
	}
	
	remote void function default( rc ) {
		param name="url.postID" default= 1;

	}
	remote void function userform( rc ) {
		param name="url.postID" default= 1;

	}
	
	remote void function addcomment( rc ) {
		param name="url.postID" default= 0;
		commentService =  beanFactory.getBean( "commentService" );
		
	 
	}
	
	
	
	 
}
