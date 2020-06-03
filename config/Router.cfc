component{

	function configure(){
		// Set Full Rewrites
		setFullRewrites( true );

		/**
		 * --------------------------------------------------------------------------
		 * App Routes
		 * --------------------------------------------------------------------------
		 *
		 * Here is where you can register the routes for your web application!
		 * Go get Funky!
		 *
		 */

		// A nice healthcheck route example
		route("/healthcheck",function(event,rc,prc){
			return "Ok!";
		});

		route("/heroes/new")
			.withAction({
				GET:"new"
			})
			.toHandler("Heroes");

		route("/heroes")
			.withAction({
				GET: "index",
				POST: "create"
			})
			.toHandler("Heroes");

		// Conventions based routing
		route( ":handler/:action?" ).end();

	}

}