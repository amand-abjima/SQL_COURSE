/*Use inner and outer joins in SQL queries to return lists of albums, artists and concert tours.

Write a query to return the following columns from the Album, Artist and Tour tables. 
Make sure to only return albums which have an associated tour.

Create another version of the same query which returns albums which do not have an associated tour. 
Replace the tour name with a message as shown below:

Add conditions to the query so that it returns albums whose title contains road but not broad.

Add a calculated column to show the length of each album as shown below and sort the results so that the longest album appears at the top.

*/

SELECT * FROM ALBUM;

SELECT * FROM ARTIST;

SELECT * FROM TOUR;

SELECT AL.TITLE, 
       AL.RELEASE_DATE,
	   AR.ARTIST,
	   T.TOUR_NAME
	   FROM ARTIST AR JOIN ALBUM AL ON AR.ARTIST_ID = AL.ARTIST_ID JOIN
	   TOUR T ON AL.ALBUM_ID = T.ALBUM_ID
	   WHERE T.ALBUM_ID IS NOT NULL;

SELECT AL.TITLE,
       AL.RELEASE_DATE,
	   AR.ARTIST,
	   ISNULL(T.TOUR_NAME,'No associated tour for '+ TITLE) AS TOUR_NAME
	   FROM ARTIST AR JOIN ALBUM AL ON AR.ARTIST_ID = AL.ARTIST_ID LEFT JOIN
	   TOUR T ON AL.ALBUM_ID = T.ALBUM_ID
	   WHERE T.ALBUM_ID IS NULL;

SELECT AL.TITLE,
       AL.RELEASE_DATE,
	   AR.ARTIST,
	   ISNULL(T.TOUR_NAME,'No associated tour for '+ TITLE) AS TOUR_NAME
	   FROM ARTIST AR JOIN ALBUM AL ON AR.ARTIST_ID = AL.ARTIST_ID LEFT JOIN
	   TOUR T ON AL.ALBUM_ID = T.ALBUM_ID
	   WHERE T.ALBUM_ID IS NULL AND TITLE LIKE '%ROAD%' AND TITLE NOT LIKE '%BROAD%';

SELECT AL.TITLE,
       AL.RELEASE_DATE,
	   CAST(AL.ALBUM_MINS AS VARCHAR(10))+'m'+' '+CAST(AL.ALBUM_SECS AS VARCHAR(10))+'s' AS ALBUM_LENGTH,
	   AR.ARTIST,
	   ISNULL(T.TOUR_NAME,'No associated tour for '+ TITLE) AS TOUR_NAME
	   FROM ARTIST AR JOIN ALBUM AL ON AR.ARTIST_ID = AL.ARTIST_ID LEFT JOIN
	   TOUR T ON AL.ALBUM_ID = T.ALBUM_ID
	   WHERE T.ALBUM_ID IS NULL AND TITLE LIKE '%ROAD%' AND TITLE NOT LIKE '%BROAD%'
	   ORDER BY ALBUM_LENGTH DESC;

