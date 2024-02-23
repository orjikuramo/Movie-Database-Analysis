/* Here is all the Sql queries used in analysing the movie data */

/* To be sure my data was succesfully uploaded from Visual Studio, i had to query all of it */
SELECT *
FROM [MMoviesData]

/* Finding the Top 10 director(s) with the highest amount of movies*/
SELECT TOP (10)
[Director_Name], COUNT([Movie_Title]) As TotalMoviesMade
FROM [MMoviesData]
GROUP BY [Director_Name]
ORDER BY [TotalMoviesMade] DESC

/* Finding the top 10 Directors (and the country) with the highest movies */
SELECT TOP (25)
[Director_Name], COUNT([Movie_Title]) As TotalMoviesMade
FROM [MMoviesData]
GROUP BY [Director_Name]
ORDER BY [TotalMoviesMade] DESC /* There is a problem with this cos when [country] was added, 'Ridley Scott' with 17 movies didnt appear */

/* Find the movies with the highest budget */
SELECT *
FROM [MMoviesData]
ORDER BY CAST([Budget] As bigint) DESC

/* Finding Top 10 movies with the most budget */
SELECT TOP (10)
[Director_Name], [Movie_Title], [Country], CAST([Budget] As bigint) As Budgeted, CAST([Gross] As bigint) As Grossed
FROM [MMoviesData]
GROUP BY [Director_Name], [Movie_Title], [Country], [Budget], [Gross]
ORDER BY [Budgeted] DESC

/* Finding Top 10 movies with the least budget */
SELECT TOP (10)
[Director_Name], [Movie_Title], [Country], CAST([Budget] As bigint) As Budgeted, CAST([Gross] As bigint) As Grossed
FROM [MMoviesData]
GROUP BY [Director_Name], [Movie_Title], [Country], [Budget], [Gross]
ORDER BY [Budgeted] ASC

/* Highest grossing movies */
SELECT *
FROM [MMoviesData]
ORDER BY CAST([Gross] As bigint) DESC

/*Finding the top 10 highest grossing movies */
SELECT TOP (10)
[Director_Name], [Movie_Title], [Country], CAST([Budget] As bigint) As Budgeted, CAST([Gross] As bigint) As Grossed
FROM [MMoviesData]
GROUP BY [Director_Name], [Movie_Title], [Country], [Budget], [Gross]
ORDER BY [Grossed] DESC

/*Finding the top 10 least grossing movies */
SELECT TOP (10)
[Director_Name], [Movie_Title], [Country], CAST([Budget] As bigint) As Budgeted, CAST([Gross] As bigint) As Grossed
FROM [MMoviesData]
GROUP BY [Director_Name], [Movie_Title], [Country], [Budget], [Gross]
ORDER BY [Grossed] ASC

/* Movies with the most revenue */
SELECT TOP (10)
[Movie_Title], [Director_Name], [Country], CAST([Gross] As bigint) As Gross, CAST([Budget] As bigint) As Budget, CAST([Gross] As bigint) - CAST([Budget] As bigint) As Revenue
FROM [MMoviesData]
GROUP BY [Director_Name], [Movie_Title], [Country], [Gross], [Budget]
ORDER BY [Revenue] DESC

/* Movies with the least revenue */
SELECT TOP (10)
[Movie_Title], [Director_Name], [Country], CAST([Gross] As bigint) As Gross, CAST([Budget] As bigint) As Budget, CAST([Gross] As bigint) - CAST([Budget] As bigint) As Revenue
FROM [MMoviesData]
GROUP BY [Director_Name], [Movie_Title], [Country], [Gross], [Budget]
ORDER BY [Revenue] ASC

/* Directors with the most revenue */
SELECT TOP (10)
[Director_Name], SUM(CAST([Gross] As bigint) - CAST([Budget] As bigint)) As TotalRevenue, 
[Country]
FROM [MMoviesData]
GROUP BY [Director_Name], [Country]
ORDER BY [TotalRevenue] DESC

/* Top 10 highest movie producing countries */
SELECT TOP (10)
[Country], COUNT([Movie_Title]) As TotalMoviesMade
FROM [MMoviesData]
GROUP BY [Country]
ORDER BY [TotalMoviesMade] DESC

/* Movies Made Per year */
SELECT [Title_Year], COUNT([Movie_Title]) As TotalMovies
FROM [MMoviesData]
GROUP BY [Title_Year]
ORDER BY [TotalMovies] DESC

/* Searching for a particular movie (in this case "The Host") */
SELECT *
FROM [MMoviesData]
WHERE [Movie_Title] = 'The Host'

/* Amount of movies per rating */
SELECT [Content_Rating], COUNT([Content_Rating]) As MovieRating
FROM [MMoviesData]
GROUP BY [Content_Rating]
ORDER BY [MovieRating]

