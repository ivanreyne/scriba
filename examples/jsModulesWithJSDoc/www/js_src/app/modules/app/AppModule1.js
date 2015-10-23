/*----------------------------------------------------------------------------*/
/*                        (c) 2015 Ivan Reyné Ferrando                        */
/*                                                                            */
/*                           http://ivanreyne.ninja                           */
/*----------------------------------------------------------------------------*/
/**
 * Test module App Module1
 *
 * @author Ivan Reyné
 * @module modules/app
 **/
define([
    "dojo/_base/declare",
    "dojo/dom-construct",
    "dojo/query",
    "app/Globals"
],
        function (
                declare,
                domConstruct,
                query,
                Globals) {

            return declare(null, {
                /*
                 * scrb: Document: DevelopersGuide
                 * scrb: Chapter: 2.3.2 Application Module1
                 * scrb: 3
                 */
                /**
                 * AppModule1 Class.
                 * Please note that the class description is shared between
                 * *Scriba* and *JSDoc*.<br/>
                 * <br/>
                 * Some Ipsum:<br/>
                 * Pastrami ground round meatball, doner strip steak kevin 
                 * fatback pig biltong chuck prosciutto brisket. Turkey chuck 
                 * boudin hamburger. Pastrami shoulder ground round venison, 
                 * pancetta biltong turkey ball tip t-bone kevin. Kevin sirloin 
                 * prosciutto pig shank boudin meatball cupim chicken strip 
                 * steak sausage biltong ham hock salami doner. Biltong spare 
                 * ribs tongue alcatra cow tenderloin rump. Shankle swine 
                 * chuck venison jerky flank.
                 *
                 * @class AppModule1
                 * @constructor
                 * @return {AppModule1} The generated object
                 */
                constructor: function () {
                    this.sContent = '<p>App Module1</p>';
                },
                /**
                 * Creates the object into the DOM
                 *
                 * @method createIn
                 * @param {String} sWhere DOM id where to put the object
                 * @return {undefined}
                 */
                createIn: function (sWhere) {
                    // DOM is already in place
                    var oWhereNode = query(sWhere);
                    if (oWhereNode.length > 0) {
                        oWhereNode = oWhereNode[0];
                        domConstruct.place(this.sContent, oWhereNode, "only");
                    }
                }
            });
        });