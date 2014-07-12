
	<!-- FORM -->
	<form ng-submit="processForm()"  class="form-horizontal" action="processForm.cfm" method="post" >
	<fieldset>
	<input type="hidden"  name="postid" class="form-control "  value="1">
		
		<legend>Add Comment:</legend>
		<!-- Form Name -->
 
		<!-- NAME -->
		<div id="name-group" class="form-group input-group-sm" ng-class="{ 'has-error' : errorName }">
			<label class="col-md-1 control-label" >Name</label>
			  <div class="col-md-3">
			<input type="text" name="name" class="form-control " placeholder="name" ng-model="formData.name">
			<span class="help-block" ng-show="errorName">{{ errorName }}</span>
			</div>
		</div>
		
		<!-- email -->
		<div id="email-group" class="form-group" ng-class="{ 'has-error' : erroremail }">
			<label class="col-md-1  control-label">email</label>
			  <div class="col-md-3">
			<input type="text" name="email" class="form-control " placeholder="email" ng-model="formData.email">
			<span class="help-block" ng-show="erroremail">{{ erroremail }}</span>
		</div>
		</div>

		<!-- website -->
		<div id="website-group" class="form-group" ng-class="{ 'has-error' : errorwebsite }">
			<label class="col-md-1  control-label">website</label>
			  <div class="col-md-3">
			<input type="text" name="website" class="form-control input-md" placeholder="website" ng-model="formData.website">
			<span class="help-block" ng-show="errorwebsite">{{ errorwebsite }}</span>
		</div>
		</div>

		<!-- body -->
		<div id="body-group" class="form-group" ng-class="{ 'has-error' : errorbody }">
			<label class="col-md-1  control-label">Comment</label>
			  <div class="col-md-3">
				<textarea name="body" id="body" class="form-control" placeholder="class" ng-model="formData.body"></textarea> 

			<span class="help-block" ng-show="errorbody">{{ errorbody }}</span>
		</div>
		</div>
		
 
  	<div class="col-md-2  col-md-offset-1">
		<!-- SUBMIT BUTTON -->
		<button type="submit" class="btn  btn-primary btn-block">
			<span class="glyphicon glyphicon-flash"></span> Submit!
		</button>
	</div>
</fieldset>	
	</form>
