component {

	property name="flashmessage" inject="FlashMessage@flashmessage";

	// Default Action
	function index( event, rc, prc ) {
		prc.welcomeMessage = "Welcome to the Hero Registry!";
		prc.errors = {};
		prc.hero = populateModel( getInstance( "Hero") );
		event.setView( "heroes/index" );
	}

	function new( event, rc, prc ) {
		prc.errors = {};
		prc.hero = populateModel( getInstance( "Hero") );
		event.setView( "heroes/new" );
	}

	function create( event, rc, prc ) {
		prc.errors = {};
		prc.hero = populateModel( getInstance( "Hero" ) );
		var result = validate( prc.hero );

		if ( result.hasErrors() ) {
			prc.errors = result.getAllErrorsAsStruct();
		} else {
			flashmessage.success( "Welcome to <b>#prc.hero.getAlliance()#</b>, #prc.hero.getCodeName()#!" );
		}
		event.setView( "heroes/new" );

	}

}
