/*----------------------------------------------------------------------------*/
/*                        (c) 2015 Ivan Reyné Ferrando                        */
/*                                                                            */
/*                           http://ivanreyne.ninja                           */
/*----------------------------------------------------------------------------*/
/**
 * Test module Extra Module2
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
                 * scrb: Chapter: 2.4.3 Extra Module2
                 * scrb: 3
                 */
                /**
                 * ExtraModule2 Class.
                 * Please note that the class description is shared between
                 * *Scriba* and *JSDoc*.<br/>
                 * <br/>
                 * Some Ipsum:<br/>
                 * Bacon ipsum dolor amet ham cow t-bone biltong capicola 
                 * doner. Beef ribs corned beef sausage, shank short ribs 
                 * shoulder brisket filet mignon bresaola kielbasa turkey 
                 * pork belly. Pancetta alcatra turkey, ham landjaeger leberkas 
                 * pork loin. Ball tip cupim ground round, turducken 
                 * landjaeger pork chop pig porchetta bacon corned beef salami 
                 * kielbasa. Fatback jerky t-bone ham. Capicola ground round 
                 * sirloin, pork loin biltong drumstick chuck pork belly 
                 * boudin strip steak hamburger pork chop picanha corned beef 
                 * filet mignon. Alcatra leberkas shank turducken shankle 
                 * doner capicola kielbasa biltong venison bacon landjaeger.
                 *
                 * @class ExtraModule2
                 * @constructor
                 * @return {ExtraModule2} The generated object
                 */
                constructor: function () {
                    this.sContent = '<p>Extra Module2</p>';
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