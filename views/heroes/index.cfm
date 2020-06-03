<cfoutput>
	<h2>#prc.welcomeMessage#</h2>
	<hr>
	<form
		method="GET"
		action="#event.buildLink( 'heroes/new' )#">
		<button type="submit" class="btn btn-primary">Begin Registration</button>
	</form>
</cfoutput>