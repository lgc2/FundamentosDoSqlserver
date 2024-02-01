CREATE OR ALTER VIEW vwCourses AS
    SELECT
        c.Id,
        c.Tag,
        c.Title,
        c.Url,
        c.Summary,
        c.CreateDate,
        ct.Title AS Category,
        a.Name AS Author
    FROM
        Course c
        INNER JOIN Category ct ON c.CategoryId = ct.Id
        INNER JOIN Author a ON c.AuthorId = a.Id
    WHERE c.Active = 1
    ;