
<cfoutput>
<form id="commentForm" class="" method="post" action="index.cfm?action=ajax.save">
	<div class="field">
		<label for="Name" class="label"> Name:</label>
		<input type="text" name="Name" id="Name" value="">
	</div>
 
	<div class="field">
		<label for="email" class="label">Email:</label>
		<input type="text" name="email" id="email" value="">
	</div> 
	
	<div class="field">
		<label for="website" class="label">website:</label>
		<input type="text" name="website" id="website" value="">
	</div> 
	
	 
	
	<div class="field">
		<label for="email" class="label">Cooment:</label>
		<textarea name="body" id="body"></textarea> 
	</div> 
	
	<div class="control">
		<input type="submit" value="Add comment">
	</div>
	
</form>
</cfoutput>