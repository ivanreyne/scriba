/*----------------------------------------------------------------------------*/
/*                        (c) 2015 Ivan Reyné Ferrando                        */
/*                                                                            */
/*                           http://ivanreyne.ninja                           */
/*----------------------------------------------------------------------------*/
/**
 * Test module Common Module0
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
                 * scrb: Chapter: 2.2 Common Modules
                 * 
                 * These are the "common" modules.
                 * 
                 * scrb: Chapter: 2.2.1 Common Module0
                 * scrb: 3
                 */
                /**
                 * CommonModule0 Class.
                 * Please note that the class description is shared between
                 * *Scriba* and *JSDoc*.<br/>
                 * <br/>
                 * Some Ipsum:<br/>
                 * Strip steak ribeye pastrami pig turducken. Pancetta meatloaf 
                 * beef ribs landjaeger pork picanha pork chop turducken 
                 * hamburger prosciutto sirloin leberkas pastrami jowl. 
                 * Flank chuck pastrami alcatra venison, filet mignon cow 
                 * prosciutto. Ground round cow beef ribs, chuck fatback 
                 * pastrami bresaola venison spare ribs boudin tri-tip short 
                 * ribs kielbasa. Pork belly prosciutto beef cupim picanha 
                 * venison pastrami shankle pork loin short ribs alcatra 
                 * spare ribs rump meatloaf. Swine turkey boudin brisket pork 
                 * loin frankfurter ribeye rump hamburger.
                 *
                 * @class CommonModule0
                 * @constructor
                 * @return {CommonModule0} The generated object
                 */
                constructor: function () {
                    this.sContent = '<p>Common Module0</p>';
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