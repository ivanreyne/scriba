/*----------------------------------------------------------------------------*/
/*                        (c) 2015 Ivan Reyné Ferrando                        */
/*                                                                            */
/*                           http://ivanreyne.ninja                           */
/*----------------------------------------------------------------------------*/
/*
 * scrb: Document: DevelopersGuide
 * scrb: Chapter: 1. Introduction
 *
 * This is an example to show the possibilities available with *Scriba* and
 * JavaScript and how it integrates with *JSDoc* generated with the YUIDoc tool.
 * _
 * The sample application simply opens a page with a menu on top to load
 * some of the modules it is made off. The sample application has been written
 * using <a href="https://dojotoolkit.org/">Dojo</a> but is is just to have a
 * "realistic" module structure to show properly the integration between
 * *Scriba* and *JSDoc*.
 * _
 * The application has the following folder structure:
 * * _app_: to hold the "application" modules.
 * * _common_: to hold the "common" modules.
 * * _extra_: to hold the "extra" modules.
 * 
 * This is just some sample text and the real purpose is to look at it in
 * conjunction with the sample application source code so you can see how the
 * things defined on the code end up showing in the generated document.
 * 
 * scrb: Chapter: 2. Sample Application Structure
 * 
 * This chapter gives a bit of an explanation on how the modules are organized.
 * Note that the contents are generated from different files and the order
 * they are in the files system does not actually matters as *Scriba* uses
 * an order based on the section numbers defined.
 *
 * scrb: Chapter: 3. Some More Ipsum to Fill the Document
 * 
 * Bacon ipsum dolor amet spare ribs ball tip porchetta, shoulder doner pork
 * pork chop rump sausage shankle. Tenderloin ball tip pork belly cow pork 
 * turkey porchetta venison. Landjaeger boudin porchetta, pancetta pork chop 
 * leberkas chicken turducken jerky ham shoulder. Shank shoulder rump beef ribs 
 * shankle doner ball tip picanha sausage. Jerky fatback cow meatloaf 
 * tenderloin kielbasa. Cupim tri-tip pork loin short ribs, hamburger sausage 
 * pork shankle. Ham hock fatback chuck rump prosciutto kielbasa.
 * _
 * Turducken salami pork shank, bresaola capicola beef ribs venison sirloin 
 * meatball ground round ball tip kevin. Sausage ball tip jerky, meatloaf 
 * kielbasa ground round turkey alcatra leberkas pig boudin. Ground round 
 * pork loin capicola pastrami. Salami kielbasa ham t-bone rump 
 * shankle prosciutto, picanha tongue kevin leberkas spare ribs venison beef 
 * ribs. Ball tip rump landjaeger kielbasa, jerky turducken shank cow beef 
 * ribs. T-bone kevin porchetta salami, ham hock beef turkey strip steak 
 * tenderloin prosciutto shankle alcatra leberkas biltong. Drumstick venison 
 * short ribs sausage meatloaf pancetta.
 * _
 * Brisket ball tip pork belly, shankle bacon andouille pork loin doner ham 
 * hock ground round jowl beef. Kielbasa hamburger leberkas drumstick. Tri-tip 
 * kevin chuck, ball tip shank tongue swine capicola drumstick picanha strip 
 * steak meatball. Kevin shankle venison bacon ham hock, drumstick jowl 
 * hamburger kielbasa t-bone pork chop fatback chicken pancetta capicola. 
 * Chuck doner tail short ribs, sirloin cupim porchetta tenderloin swine 
 * cow boudin pig fatback strip steak. Pig chicken ball tip, chuck prosciutto 
 * venison doner ribeye pork chop hamburger pork swine.
 */ 

/**
 * Application, class to manage the entire application
 *
 * @author Ivan Reyné
 * @module app
 * @main app
 **/
define([
    "dojo/_base/declare",
    "dojo/dom-construct",
    "dojo/query",
    "app/Globals",
    "app/modules/common/CommonModule0"
],
        function (
                declare,
                domConstruct,
                query,
                Globals,
                Module0) {

            return declare(null, {
                /*
                 * scrb: Chapter: 2.1 Application
                 * scrb: 3
                 */
                /**
                 * The Application class holds the main functionality of the
                 * application. In the Application we define the main HTML
                 * content and structure of the application.
                 * Please note that the class description is shared between
                 * *Scriba* and *JSDoc*.
                 *
                 * @class Application
                 * @extends AppLoop
                 * @constructor
                 * @return {AppLoop} The generated object
                 */
                constructor: function () {
                    this.sContent = '<div class="app_module_content">' +
                            '<div class="menu_area">' +
                            '<div class="common_module0 button">Common Module0</div>' +
                            '<div class="app_module0 button">App Module0</div>' +
                            '<div class="extra_module0 button">Extra Module0</div>' +
                            '<div class="extra_module1 button">Extra Module1</div>' +
                            '<div class="extra_module2 button">Extra Module2</div>' +
                            '<div class="logout_btn button">Logout</div>' +
                            '</div>' +
                            '<div class="content_area"><p>Application Content</p></div>' +
                            '</div>';
                },
                /**
                 * Creates the object into the DOM
                 *
                 * @method createIn
                 * @param {String} sWhere DOM id where to put the object
                 * @return {undefined}
                 */
                createIn: function (sWhere) {
                    /*
                     * scrb:
                     * _
                     * The Application.createIn method will use the Dojo
                     * functions to put the HTML previously defined into the
                     * web browser DOM. After that it will create some click
                     * handlers on the application menu to execute actions
                     * when the menu options are selected.
                     */
                    
                    // DOM is already in place
                    var oWhereNode = query(sWhere);
                    if (oWhereNode.length > 0) {
                        oWhereNode = oWhereNode[0];
                        domConstruct.place(this.sContent, oWhereNode, "only");

                        // defining the click handlers to load the modules
                        var oTempNode = query(".common_module0", oWhereNode);
                        if (oTempNode.length > 0) {
                            oTempNode.on("click", function () {
                                // static module load
                                var oTempModule = new Module0();
                                oTempModule.createIn(".content_area");
                            });
                        }
                        oTempNode = query(".app_module0", oWhereNode);
                        if (oTempNode.length > 0) {
                            oTempNode.on("click", function () {
                                require(["app/modules/app/AppModule0"], function (AppModule0) {
                                    // conditional/dynamic module load
                                    var oTempModule = new AppModule0();
                                    oTempModule.createIn(".content_area");
                                });
                            });
                        }
                        oTempNode = query(".extra_module0", oWhereNode);
                        if (oTempNode.length > 0) {
                            oTempNode.on("click", function () {
                                require(["app/modules/extra/ExtraModule0"], function (AppModule0) {
                                    // conditional/dynamic module load
                                    var oTempModule = new AppModule0();
                                    oTempModule.createIn(".content_area");
                                });
                            });
                        }
                        oTempNode = query(".extra_module1", oWhereNode);
                        if (oTempNode.length > 0) {
                            oTempNode.on("click", function () {
                                require(["app/modules/extra/ExtraModule1"], function (AppModule0) {
                                    // conditional/dynamic module load
                                    var oTempModule = new AppModule0();
                                    oTempModule.createIn(".content_area");
                                });
                            });
                        }
                        oTempNode = query(".extra_module2", oWhereNode);
                        if (oTempNode.length > 0) {
                            oTempNode.on("click", function () {
                                require(["app/modules/extra/ExtraModule2"], function (AppModule0) {
                                    // conditional/dynamic module load
                                    var oTempModule = new AppModule0();
                                    oTempModule.createIn(".content_area");
                                });
                            });
                        }
                        var oLogoutNode = query(".logout_btn", oWhereNode);
                        if(oLogoutNode.length > 0) {
                            oLogoutNode.on("click", function() {
                                // logout
                                window.location.assign("index.html");
                            });
                        }
                    }
                }
            });
        });