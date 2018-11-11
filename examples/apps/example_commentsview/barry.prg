create table comments(;
						parentid char(80),;
						nodeid int autoinc,;
						parentnodeid int,;
						childkey char(100),;
						datetime datetime,;
						username char(80),;
						topic char(80),;
						comment varchar)