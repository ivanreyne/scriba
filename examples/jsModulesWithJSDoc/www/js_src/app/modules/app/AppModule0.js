/*----------------------------------------------------------------------------*/
/*                        (c) 2015 Ivan Reyné Ferrando                        */
/*                                                                            */
/*                           http://ivanreyne.ninja                           */
/*----------------------------------------------------------------------------*/
/**
 * Test module App Module0
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
                 * scrb: Chapter: 2.3 Application Modules
                 * 
                 * These are the "application" modules.
                 * 
                 * scrb: Chapter: 2.3.1 Application Module0
                 * scrb: 3
                 */
                /**
                 * AppModule0 Class.
                 * Please note that the class description is shared between
                 * *Scriba* and *JSDoc*.<br/>
                 * <br/>
                 * Some Ipsum:<br/>
                 * Kevin short ribs hamburger frankfurter landjaeger ball tip 
                 * pig pancetta beef chicken fatback prosciutto picanha 
                 * turducken capicola. Strip steak picanha filet mignon, 
                 * spare ribs ribeye rump pancetta capicola short ribs jowl 
                 * chuck frankfurter landjaeger sirloin ham. Kielbasa filet 
                 * mignon turkey andouille bacon turducken tongue bresaola 
                 * cupim porchetta sausage. Frankfurter hamburger andouille 
                 * meatloaf, flank ham hock beef shoulder tenderloin venison 
                 * landjaeger sausage. Kielbasa ground round brisket swine 
                 * tongue t-bone.
                 *
                 * @class AppModule0
                 * @constructor
                 * @return {AppModule0} The generated object
                 */
                constructor: function () {
                    this.sContent = '<p>App Module0</p>';
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