/// <reference path="../../library/Lianja.d.ts" />
//------------------------------------------------

//
// Lianja custom TypeScript section "page1_section1"
//

// declare classes like this
class Point {
    constructor(public x, public y) {}
    getDistance(p: Point) {
        let dx = p.x - this.x;
        let dy = p.y - this.y;
        return Math.sqrt(dx ** 2 + dy ** 2);
    }
}
var p:Point = new Point(1,2);

// need to declare variables for type checking
declare var returnvalue: Lianja.Section;
declare var osection: Lianja.Section;
declare var ocont: Lianja.Container;

// now create the UI hierachy
osection = createObject("osection", "section");
osection.addObject('ocont','container');
ocont.backcolor = "orange"; 

// need to set returnvalue to the object created  
returnvalue = osection;
