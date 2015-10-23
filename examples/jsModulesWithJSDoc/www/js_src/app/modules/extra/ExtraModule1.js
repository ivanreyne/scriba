/*----------------------------------------------------------------------------*/
/*                        (c) 2015 Ivan Reyné Ferrando                        */
/*                                                                            */
/*                           http://ivanreyne.ninja                           */
/*----------------------------------------------------------------------------*/
/**
 * Test module Extra Module1
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
                 * scrb: Chapter: 2.4.2 Extra Module1
                 * scrb: 3
                 */
                /**
                 * ExtraModule1 Class.
                 * Please note that the class description is shared between
                 * *Scriba* and *JSDoc*.<br/>
                 * <br/>
                 * Some Ipsum:<br/>
                 * Brisket frankfurter pancetta tongue pastrami cupim kevin. 
                 * Biltong tenderloin sirloin, bacon prosciutto bresaola rump 
                 * picanha capicola tail cow ball tip. Ribeye turducken salami 
                 * beef ribs cupim shank cow turkey. Capicola pig jowl 
                 * shoulder, pastrami pork belly bresaola chuck tri-tip.
                 *
                 * @class ExtraModule1
                 * @constructor
                 * @return {ExtraModule1} The generated object
                 */
                constructor: function () {
                    this.sContent = '<p>Extra Module1</p>';
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