/*----------------------------------------------------------------------------*/
/*                        (c) 2015 Ivan Reyné Ferrando                        */
/*                                                                            */
/*                           http://ivanreyne.ninja                           */
/*----------------------------------------------------------------------------*/
/**
 * Test module Extra Module0
 *
 * @author Ivan Reyné
 * @module modules/extra
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
                 * scrb: Chapter: 2.4 Extra Modules
                 * 
                 * These are the "extra" modules.
                 * 
                 * scrb: Chapter: 2.4.1 Extra Module0
                 * scrb: 3
                 */
                /**
                 * ExtraModule0 Class.
                 * Please note that the class description is shared between
                 * *Scriba* and *JSDoc*.<br/>
                 * <br/>
                 * Some Ipsum:<br/>
                 * Spare ribs kielbasa corned beef pastrami, pork chop 
                 * turducken drumstick. Pork chop beef ribs hamburger bresaola, 
                 * brisket landjaeger strip steak drumstick bacon kevin 
                 * chicken pork loin. Alcatra spare ribs doner, fatback 
                 * pastrami jowl beef beef ribs sirloin. Boudin turkey 
                 * kielbasa, sausage turducken picanha shank pig cupim 
                 * tenderloin biltong kevin. Beef ribs turducken jerky 
                 * pancetta pork jowl tongue sirloin. Jowl turkey landjaeger 
                 * pig, boudin corned beef beef sirloin.
                 *
                 * @class ExtraModule0
                 * @constructor
                 * @return {ExtraModule0} The generated object
                 */
                constructor: function () {
                    this.sContent = '<p>Extra Module0</p>';
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