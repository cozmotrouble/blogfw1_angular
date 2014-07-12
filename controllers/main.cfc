component accessors="true" {

    property beanFactory;
    property formatterService;
	
	remote any function init( fw ) {
		variables.fw = fw;
		return this;
	}
	
	remote void function default( rc ) {
		param name="url.postID" default= 1;
      //  var postService = variables.beanFactory.getBean( "postService" );
		  // rc.post =  application.postService.get(url.postID);
		  // rc.postlist =  application.postService.list();
		  // rc.postsArray =  rc.postlist ;
	}
	remote void function userform( rc ) {
		param name="url.postID" default= 1;
      //  var postService = variables.beanFactory.getBean( "postService" );
		  // rc.post =  application.postService.get(url.postID);
		  // rc.postlist =  application.postService.list();
		  // rc.postsArray =  rc.postlist ;
	}
	
	remote void function addcomment( rc ) {
		param name="url.postID" default= 0;
 
	/*	 beanFactory = new _BlogFW1_Angular.org.corfield.ioc( "model" );
		 beanFactory = new _BlogFW1_Angular.org.corfield.ioc( "model" );*/
		  commentService =  beanFactory.getBean( "commentService" );
	//	var postService = variables.beanFactory.getBean( "commentService" );
		
		
      //  var postService = variables.beanFactory.getBean( "postService" );
		  // rc.post =  application.postService.get(url.postID);
		  // rc.postlist =  application.postService.list();
		  // rc.postsArray =  rc.postlist ;
	}
	
	
	
	 
}
