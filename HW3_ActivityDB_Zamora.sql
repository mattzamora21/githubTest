
/*
My HW 3 with the queries listed below with each table result

Name: Matthew Zamora
ID: 1212882006

*/


CREATE TABLE ActivityLog_2019Feb (
	logID int,
    activityID int,
    durationMin int,
    timeStart timestamp 
);

INSERT INTO ActivityLog_2019Feb VALUES(1, 1, 60, '2019-02-01 08:00:00');
INSERT INTO ActivityLog_2019Feb VALUES(2, 2, 30, '2019-02-01 09:50:00');
INSERT INTO ActivityLog_2019Feb VALUES(3, 3, 20,'2019-02-04 08:00:00');
INSERT INTO ActivityLog_2019Feb VALUES(4, 6, 60, '2019-02-05 07:50:00');
INSERT INTO ActivityLog_2019Feb VALUES(5, 1, 120, '2019-02-06 07:50:00');
INSERT INTO ActivityLog_2019Feb VALUES(6, 8, 60, '2019-02-09 08:00:00');
INSERT INTO ActivityLog_2019Feb VALUES(7, 4, 200, '2019-02-11 08:50:00');
INSERT INTO ActivityLog_2019Feb VALUES(8, 7, 30, '2019-02-12 08:50:00');
INSERT INTO ActivityLog_2019Feb VALUES(9, 3, 10, '2019-02-15 09:50:00');
INSERT INTO ActivityLog_2019Feb VALUES(10, 2, 40,'2019-02-17 13:50:00');
INSERT INTO ActivityLog_2019Feb VALUES(11, 6, 40,'2019-02-20 16:50:00');
INSERT INTO ActivityLog_2019Feb VALUES(12, 4, 60, '2019-02-21 08:50:00');




CREATE TABLE ActivityCalories (
    activityID int,
    activity varchar(255),
    caloriesPerHour int
);

INSERT INTO ActivityCalories VALUES(1, 'walking', 300);
INSERT INTO ActivityCalories VALUES(2, 'jogging', 500);
INSERT INTO ActivityCalories VALUES(3, 'meditating', 50);
INSERT INTO ActivityCalories VALUES(4, 'gaming', 100);
INSERT INTO ActivityCalories VALUES(5, 'tennis', 500);
INSERT INTO ActivityCalories VALUES(6, 'swimming', 700);
INSERT INTO ActivityCalories VALUES(7, 'biking', 500);
INSERT INTO ActivityCalories VALUES(8, 'yoga', 300);


/* QUERIES LISTED BELOW*/


/*1. Query the contents of the entire ActivityCalories table. */
SELECT * FROM ActivityCalories;

/*
| activityID |   activity | caloriesPerHour |
|------------|------------|-----------------|
|          1 |    walking |             300 |
|          2 |    jogging |             500 |
|          3 | meditating |              50 |
|          4 |     gaming |             100 |
|          5 |     tennis |             500 |
|          6 |   swimming |             700 |
|          7 |     biking |             500 |
|          8 |       yoga |             300 |




/* 2. Query the contents of the entire ActivityLog_2019Feb table. */
SELECT * FROM ActivityLog_2019Feb;

/*
| logID | activityID | durationMin |            timeStart |
|-------|------------|-------------|----------------------|
|     1 |          1 |          60 | 2019-02-01T08:00:00Z |
|     2 |          2 |          30 | 2019-02-01T09:50:00Z |
|     3 |          3 |          20 | 2019-02-04T08:00:00Z |
|     4 |          6 |          60 | 2019-02-05T07:50:00Z |
|     5 |          1 |         120 | 2019-02-06T07:50:00Z |
|     6 |          8 |          60 | 2019-02-09T08:00:00Z |
|     7 |          4 |         200 | 2019-02-11T08:50:00Z |
|     8 |          7 |          30 | 2019-02-12T08:50:00Z |
|     9 |          3 |          10 | 2019-02-15T09:50:00Z |
|    10 |          2 |          40 | 2019-02-17T13:50:00Z |
|    11 |          6 |          40 | 2019-02-20T16:50:00Z |
|    12 |          4 |          60 | 2019-02-21T08:50:00Z |





/* 3. Query all the activities logged in the ActivityLog_2019Feb that are in the calorie count list.
Create a table with activity and duration fields. (Activities can be listed more than once.) */

SELECT ActivityCalories.activity, ActivityLog_2019Feb.durationMin
FROM ActivityCalories
INNER JOIN ActivityLog_2019Feb
ON ActivityLog_2019Feb.activityID = ActivityCalories.activityID;

/*
|   activity | durationMin |
|------------|-------------|
|    walking |          60 |
|    jogging |          30 |
| meditating |          20 |
|    walking |         120 |
|     gaming |         200 |
| meditating |          10 |
|    jogging |          40 |
|     gaming |          60 |
|   swimming |          60 |
|       yoga |          60 |
|     biking |          30 |
|   swimming |          40 |


/*4. Query the activities done on Feb 1 2019. Create a table with the activities and duration*/
SELECT ActivityCalories.activity, ActivityLog_2019Feb.durationMin
FROM ActivityCalories
INNER JOIN ActivityLog_2019Feb
ON ActivityCalories.activityID = ActivityLog_2019Feb.activityID
WHERE ActivityLog_2019Feb.timeStart LIKE '2019-02-01%'


/*
| activity | durationMin |
|----------|-------------|
|  walking |          60 |
|  jogging |          30 |



/*5. Query the total duration of activity on Feb 1 2019*/
SELECT SUM(ActivityLog_2019Feb.durationMin)
FROM ActivityLog_2019Feb
WHERE ActivityLog_2019Feb.timeStart LIKE '2019-02-01%'

/*
| SUM(ActivityLog_2019Feb.durationMin) |
|--------------------------------------|
|                                   90 |

/*6. Query the minutes spent walking. */
SELECT SUM(ActivityLog_2019Feb.durationMin)
FROM ActivityLog_2019Feb
WHERE ActivityLog_2019Feb.activityID LIKE '1'

/*
| SUM(ActivityLog_2019Feb.durationMin) |
|--------------------------------------|
|                                  180 |


/*7. Query the days walking. Create a table with time started and the duration.*/
SELECT ActivityLog_2019Feb.timeStart, ActivityLog_2019Feb.durationMin
FROM ActivityLog_2019Feb
WHERE ActivityLog_2019Feb.activityID LIKE '1'

/*
|            timeStart | durationMin |
|----------------------|-------------|
| 2019-02-01T08:00:00Z |          60 |
| 2019-02-06T07:50:00Z |         120 |


/* 8. Query all the distinct activities logged in the ActivityLog_2019Feb that are in the calorie count
list. (Activities can be listed only once.) Use SELECT DISTINCT.*/

SELECT DISTINCT 
    ActivityCalories.activity
FROM 
    ActivityCalories
INNER JOIN ActivityLog_2019Feb
ON ActivityLog_2019Feb.activityID = ActivityCalories.activityID;

/*
|   activity |
|------------|
|    walking |
|    jogging |
| meditating |
|     gaming |
|   swimming |
|       yoga |
|     biking |



/*
*/




