/*----------------------------------------------------------------------------*/
/*                        (c) 2015 Ivan Reyné Ferrando                        */
/*                                                                            */
/*                           http://ivanreyne.ninja                           */
/*----------------------------------------------------------------------------*/
/**
 * Test module Common Module2
 *
 * @author Ivan Reyné
 * @module modules/common
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
                 * scrb: Chapter: 2.2.3 Common Module2
                 * scrb: 3
                 */
                /**
                 * CommonModule2 Class.
                 * Please note that the class description is shared between
                 * *Scriba* and *JSDoc*.<br/>
                 * <br/>
                 * Some Ipsum:<br/>
                 * Doner flank ham hock chicken shank. Rump ground round
                 * picanha porchetta leberkas boudin sirloin t-bone. Tenderloin 
                 * pancetta pork fatback flank, porchetta spare ribs venison 
                 * hamburger ground round kevin. Corned beef ham strip steak 
                 * beef ribs, ribeye salami turducken bresaola kielbasa rump 
                 * landjaeger chuck. Pork belly turkey swine, kielbasa jowl 
                 * ribeye doner.
                 *
                 * @class CommonModule2
                 * @constructor
                 * @return {CommonModule2} The generated object
                 */
                constructor: function () {
                    this.sContent = '<p>Common Module2</p>';
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