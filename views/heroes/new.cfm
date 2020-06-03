<cfoutput>
	<h1>Register as a New Hero</h1>
	<hr>
	<form
		method="POST"
		action="#event.buildLink( 'heroes' )#">
		<div class="row">
			<div class="form-group col-md-12">
				<label for="codeName">Code Name</label>
				<input
					type="text"
					class="form-control <cfif prc.errors.keyExists("codeName")>error</cfif>"
					id="codeName"
					name="codeName"
					value="#prc.hero.getCodeName()#">
				<cfif prc.errors.keyExists("codeName")>
					<small class="form-text text-danger">
						<cfloop array="#prc.errors.codeName#" index="error">
							<p>#error.message#</p>
						</cfloop>
					</small>
				<cfelse>
					<small id="codeNameHelp" class="form-text text-muted">[Required Unless Other Conditions are Met; 4 to 20 Characters]</small>
				</cfif>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-12">
				<label for="alliance">Alliance</label>
				<select
					type="text"
					class="form-control <cfif prc.errors.keyExists("alliance")>error</cfif>"
					id="alliance"
					name="alliance"
					required>
					<option <cfif isNull(prc.hero.getAlliance())> selected </cfif> disabled > Choose... </option>
					<option <cfif prc.hero.getAlliance() EQ "The Avengers"> selected </cfif>>The Avengers</option>
					<option <cfif prc.hero.getAlliance() EQ "The Guardians of the Galaxy"> selected </cfif>>The Guardians of the Galaxy</option>
					<option <cfif prc.hero.getAlliance() EQ "S.H.I.E.L.D."> selected </cfif>>S.H.I.E.L.D.</option>
					<option <cfif prc.hero.getAlliance() EQ "X-Men"> selected </cfif> disabled>X-Men (Coming Soon)</option>
				</select>
				<cfif prc.errors.keyExists("alliance")>
					<small class="form-text text-danger">
						<cfloop array="#prc.errors.alliance#" index="error">
							<p>#error.message#</p>
						</cfloop>
					</small>
				<cfelse>
					<small id="allianceHelp" class="form-text text-muted">[Required]</small>
				</cfif>
			</div>
		</div>
		<h4>Background Check</h4>
		<hr>
		<div class="row">
			<div class="form-group  col-md-12">
				<label for="nemesis">Nemesis</label>
				<input
					type="text"
					class="form-control <cfif prc.errors.keyExists("nemesis")>error</cfif>"
					id="nemesis"
					name="nemesis"
					value="#prc.hero.getNemesis()#">
				<cfif prc.errors.keyExists("nemesis")>
					<small class="form-text text-danger">
						<cfloop array="#prc.errors.nemesis#" index="error">
							<p>#error.message#</p>
						</cfloop>
					</small>
				</cfif>
			</div>
		</div>
		<div class="row">
			<div class="form-group  col-md-6">
				<label for="activeSince">Active Since</label>
				<input
					type="date"
					class="form-control <cfif prc.errors.keyExists("activeSince")>error</cfif>"
					id="activeSince"
					name="activeSince"
					required
					value=<cfif isNull( prc.hero.getActiveSince() )>#dateFormat(now(),"yyyy-mm-dd")#
						<cfelse>#dateFormat(prc.hero.getActiveSince(),"yyyy-mm-dd")#
						</cfif>>
				<cfif prc.errors.keyExists("activeSince")>
					<small class="form-text text-danger">
						<cfloop array="#prc.errors.activeSince#" index="error">
							<p>#error.message#</p>
						</cfloop>
					</small>
				<cfelse>
					<small class="form-text text-muted">[Required; Must Meet Minimum Requirement.]</small>
				</cfif>
			</div>
			<div class="form-group  col-md-6">
				<label for="civiliansSaved">Civilians Saved</label>
				<input
					type="number"
					class="form-control <cfif prc.errors.keyExists("civiliansSaved")>error</cfif>"
					id="civiliansSaved"
					name="civiliansSaved"
					required
					value=<cfif isNull( prc.hero.getCiviliansSaved() )>0
					<cfelse>#prc.hero.getCiviliansSaved()#
					</cfif>>
				<cfif prc.errors.keyExists("civiliansSaved")>
					<small class="form-text text-danger">
						<cfloop array="#prc.errors.civiliansSaved#" index="error">
							<p>#error.message#</p>
						</cfloop>
					</small>
				<cfelse>
					<small class="form-text text-muted">[Required; Must Meet Minimum Requirement.]</small>
				</cfif>
			</div>

		</div>
		<h4>Legal Stuff</h4>
		<hr>
		<div class="row">
			<div class="form-group col-md-6">
				<label for="firstName">First Name</label>
				<input
					type="text"
					class="form-control <cfif prc.errors.keyExists("firstName")>error</cfif>"
					id="firstName"
					name="firstName"
					value="#prc.hero.getFirstName()#">
				<cfif prc.errors.keyExists("firstName")>
					<small class="form-text text-danger">
						<cfloop array="#prc.errors.firstName#" index="error">
							<p>#error.message#</p>
						</cfloop>
					</small>
				</cfif>
			</div>
			<div class="form-group col-md-6">
				<label for="lastName">Last Name</label>
				<input
					type="text"
					class="form-control <cfif prc.errors.keyExists("lastName")>error</cfif>"
					id="lastName"
					name="lastName"
					value="#prc.hero.getLastName()#">
				<cfif prc.errors.keyExists("lastName")>
					<small class="form-text text-danger">
						<cfloop array="#prc.errors.lastName#" index="error">
							<p>#error.message#</p>
						</cfloop>
					</small>
				<cfelse>
					<small id="lastNameHelp" class="form-text text-muted">[Required If Registering with S.H.I.E.L.D.]</small>
				</cfif>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Register</button>
	</form>

</cfoutput>

<style>
	.error {
		border: 1px solid red;
		box-shadow: 0 0 5px red;
	}
</style>