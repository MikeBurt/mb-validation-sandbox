component accessors="true" {

	property name="HeroService" inject="id";

	property name="codeName"       type="string";
	property name="alliance"       type="string";
	property name="nemesis"        type="string";
	property name="civiliansSaved" type="numeric";
	property name="activeSince"    type="date";
	property name="firstName"      type="string";
	property name="lastName"       type="string";

	this.constraints = {
		"codeName" : {
			requiredUnless        : { firstName : "Thor" },
			requiredUnlessMessage : "Code Name is required unless your first name is Thor.",
			size                  : "4..20",
			sizeMessage           : "Code Names must be between 4 and 20 characters."
		},
		"alliance" : {
			required        : true,
			requiredMessage : "Please choose a team to align with."
		},
		"lastName" : {
			requiredIf        : { alliance : "S.H.I.E.L.D." },
			requiredIfMessage : "Registry with S.H.I.E.L.D. requires a last name."
		},
		"civiliansSaved" : {
			min        : 10,
			minMessage : "Minimum requirement for 'Civilians Saved' has not been met."
		},
		"nemesis" : {
			inList        : "Red Skull,Loki,Thanos",
			inListMessage : "Your nemesis has not been identified as a credible threat."
		},
		"activeSince" : {
			discrete        : "lt:2020-05-15",
			discreteMessage : "Minimum requirements for 'Active Service' has not been met."
		}
	};

	function save() {
		return HeroService.save( this );
	}

	function asStruct() {
		return {
			"codeName"  : getCodeName(),
			"alliance"  : getAlliance(),
			"firstName" : getFirstName(),
			"lastName"  : getLastName()
		};
	}

}
