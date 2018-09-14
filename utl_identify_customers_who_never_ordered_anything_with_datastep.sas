
Identify Customers who never ordered anything with data step

see SAS forum
https://tinyurl.com/y9kyn25f
https://communities.sas.com/t5/SAS-Programming/customers-who-never-order-anything-with-data-step/m-p/494401


INPUT
                          |  RULES  Henry and Max have no orders
 WORK.CUST     WORK.ORD   |
 ----------    -------    |
 ID    CUST        ID     |  ID CUST    ID=3 and 1 are have ordered from uss
                          |             so do not reach out to them
  1    Joe          3     |
  2    Henry        1     |   2 Henry   2 and 4 have never ordered so
  3    Sam                |   4 Max     reach out to them
  4    Max                |


PROCESS
=======

data want;
  set cust;
  set ord key=id / unique;
  if _iorc_  ne  0; * could do more detailed analysis but this works;
run;quit;


OUTPUT
======

WORK.WANT total obs=2

 ID    CUST

  2    Henry
  4    Max

*                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|

;

data cust;
 input Id cust$;
cards4;
 1 Joe
 2 Henry
 3 Sam
 4 Max
;;;;
run;quit;

data Ord(index=(id/unique));;
 input id;
cards4;
 3
 1
;;;;
run;quit;



