CREATE OR ALTER VIEW vwCarrers AS
    SELECT
        c.Id,
        c.Title AS Career,
        c.Url,
        COUNT(cs.Title) AS CoursesCount
    FROM
        Career c
        INNER JOIN CareerItem ci ON c.Id = ci.CareerId
        INNER JOIN Course cs ON ci.CourseId = cs.Id
    WHERE
        cs.Active = 1
    GROUP BY c.Id, c.Title, c.Url
    ;