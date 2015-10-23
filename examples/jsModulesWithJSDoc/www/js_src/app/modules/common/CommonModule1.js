/*----------------------------------------------------------------------------*/
/*                        (c) 2015 Ivan Reyné Ferrando                        */
/*                                                                            */
/*                           http://ivanreyne.ninja                           */
/*----------------------------------------------------------------------------*/
/**
 * Test module Common Module1
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
                 * scrb: Chapter: 2.2.2 Common Module1
                 * scrb: 3
                 */
                /**
                 * CommonModule1 Class.
                 * Please note that the class description is shared between
                 * *Scriba* and *JSDoc*.<br/>
                 * <br/>
                 * Some Ipsum:<br/>
                 * Jowl picanha alcatra, leberkas boudin ribeye porchetta 
                 * corned beef sausage chicken pastrami pork kevin tenderloin 
                 * swine. Biltong meatloaf shoulder landjaeger pork chop tail 
                 * tenderloin kielbasa fatback brisket. Shoulder beef ribs 
                 * pork chop tail tongue meatloaf picanha andouille cupim 
                 * chuck salami. Cow ball tip porchetta, hamburger short ribs 
                 * tri-tip landjaeger meatloaf chuck sausage.
                 *
                 * @class CommonModule1
                 * @constructor
                 * @return {CommonModule1} The generated object
                 */
                constructor: function () {
                    this.sContent = '<p>Common Module1</p>';
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