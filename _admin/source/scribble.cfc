		if ( url.authorID eq 0){
			author = New author() ;
		}else{
			author = entityLoad("author", url.authorID, true) ;
		}