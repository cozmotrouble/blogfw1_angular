<cfset rc.title = "AngualrJS FW/1 ORM Blog" />	<!--- set a variable to be used in a layout --->
 <div class="page-header">
    <h1>Blog Entries</h1>
  </div>

  <div class="row">
 
  <div id="periodicTable"  data-ng-controller="MyController" >
        <table class="table table-striped table-bordered table-hover table-condensed">
            <tr>
                <th>Title</th>
                <th>Author</th>
                <th>Number of comments</th>
            </tr>
            <tr data-ng-repeat="item in blogentries">
                <td>{{item.title}} </td>
                <td>{{item.author.firstName}} {{item.author.lastName}}  </td>
                <td> {{item.comments.length}}</td> 
          
            </tr>
        </table>
    </div>
