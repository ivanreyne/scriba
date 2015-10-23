/*----------------------------------------------------------------------------*/
/*                        (c) 2015 Ivan Reyné Ferrando                        */
/*                                                                            */
/*                           http://ivanreyne.ninja                           */
/*----------------------------------------------------------------------------*/
/**
 * Main Entry Point, class to manage the application entry point
 *
 * @author Ivan Reyné
 * @module app
 **/
define([
    "dojo/_base/declare",
    "app/Globals",
    "app/Application"
],
        function (
                declare,
                Globals,
                Application) {

            return declare(null, {
                /**
                 * Class to manage the application entry point
                 *
                 * @class MainEntryPoint
                 * @static
                 */
                MainEntryPoint: function () {
                },
                /**
                 * Functions we need to call just after the page load has finished to start the application
                 *
                 * @static
                 * @method loadApplication
                 * @return {undefined}
                 */
                loadApplication: function () {
                    // creating the main application
                    Globals.oApplication = new Application();
                    Globals.oApplication.createIn(".app_content");
                }
            });
        });