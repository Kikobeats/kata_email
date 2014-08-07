/*
Dependencies
 */
 var CoffeeScript= require("coffee-script");

 // Register CoffeeScript if exits
 if(CoffeeScript.register) CoffeeScript.register();


antispam = require('./lib/antispam');


/*
Exports
 */
module.exports = antispam;
