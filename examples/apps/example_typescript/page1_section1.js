/// <reference path="../../library/Lianja.d.ts" />
//------------------------------------------------
//
// Lianja custom TypeScript section "page1_section1"
//
// declare classes like this
var Point = /** @class */ (function () {
    function Point(x, y) {
        this.x = x;
        this.y = y;
    }
    Point.prototype.getDistance = function (p) {
        var dx = p.x - this.x;
        var dy = p.y - this.y;
        return Math.sqrt(Math.pow(dx, 2) + Math.pow(dy, 2));
    };
    return Point;
}());
var p = new Point(1, 2);
// now create the UI hierachy
osection = createObject("osection", "section");
osection.addObject('ocont', 'container');
ocont.backcolor = "orange";
// need to set returnvalue to the object created  
returnvalue = osection;
