/*----------------------------------------------------------------------------*/
/*                        (c) 2015 Ivan Reyné Ferrando                        */
/*                                                                            */
/*                           http://ivanreyne.ninja                           */
/*----------------------------------------------------------------------------*/
/**
 * Test module App Module3
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
                 * scrb: Chapter: 2.3.4 Application Module3
                 * scrb: 3
                 */
                /**
                 * AppModule3 Class.
                 * Please note that the class description is shared between
                 * *Scriba* and *JSDoc*.<br/>
                 * <br/>
                 * Some Ipsum:<br/>
                 * Capicola turducken jerky, turkey meatball spare ribs 
                 * bresaola. Prosciutto spare ribs sirloin ham hock pastrami. 
                 * Meatball alcatra landjaeger, chicken fatback andouille tail 
                 * ribeye drumstick meatloaf short ribs. Jerky porchetta 
                 * bresaola filet mignon turkey. Kevin tongue chuck, chicken 
                 * pork doner spare ribs swine ham hock brisket tenderloin 
                 * turducken short loin beef.<br/>
                 * <br/>
                 * Pork shank flank beef ribs, filet mignon ham brisket corned 
                 * beef picanha rump. Jowl capicola short ribs frankfurter 
                 * ground round. Flank chuck filet mignon shankle spare ribs 
                 * brisket capicola sirloin shank landjaeger ham hock short 
                 * loin turducken tenderloin kevin. Chuck t-bone pancetta strip 
                 * steak, sausage tail andouille.
                 *
                 * @class AppModule3
                 * @constructor
                 * @return {AppModule3} The generated object
                 */
                constructor: function () {
                    this.sContent = '<p>App Module3</p>';
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