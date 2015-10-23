/*----------------------------------------------------------------------------*/
/*                        (c) 2015 Ivan Reyné Ferrando                        */
/*                                                                            */
/*                           http://ivanreyne.ninja                           */
/*----------------------------------------------------------------------------*/
/**
 * Test module App Module2
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
                 * scrb: Chapter: 2.3.3 Application Module2
                 * scrb: 3
                 */
                /**
                 * AppModule2 Class.
                 * Please note that the class description is shared between
                 * *Scriba* and *JSDoc*.<br/>
                 * <br/>
                 * Some Ipsum:<br/>
                 * Prosciutto shankle tri-tip pork belly sirloin. Shoulder 
                 * t-bone biltong ground round ball tip pork chop pork belly 
                 * jowl boudin pig. Chicken brisket doner, cow strip steak 
                 * prosciutto landjaeger drumstick bacon short loin swine. 
                 * Drumstick brisket short loin pastrami sirloin fatback 
                 * capicola bresaola tenderloin spare ribs biltong frankfurter.
                 *
                 * @class AppModule2
                 * @constructor
                 * @return {AppModule2} The generated object
                 */
                constructor: function () {
                    this.sContent = '<p>App Module2</p>';
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