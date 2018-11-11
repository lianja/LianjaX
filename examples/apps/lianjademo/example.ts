/// <reference path="../../library/Lianja.d.ts" />

let db = openDatabase("southwind") as Lianja.Database;
let rs = db.openRecordSet("customers") as Lianja.Recordset;

Lianja.writeOutput("Hello world");
