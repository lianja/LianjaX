/// <reference path="../../library/Lianja.d.ts" />
var db = openDatabase("southwind");
var rs = db.openRecordSet("customers");
Lianja.writeOutput("Hello world");
