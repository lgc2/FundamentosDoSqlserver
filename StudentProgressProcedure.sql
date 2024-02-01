CREATE OR ALTER PROCEDURE spStudentProgress(
    @StudentId UNIQUEIDENTIFIER
)
AS
    SELECT
        s.Name AS Student,
        c.Title AS Course,
        sc.Progress,
        sc.LastUpdateDate
    FROM
        StudentCourse sc
        INNER JOIN Student s ON sc.StudentId = s.Id
        INNER JOIN Course c ON sc.CourseId = c.Id
    WHERE
        sc.StudentId = @StudentId
        AND sc.Progress < 100
        AND sc.Progress > 0
    ORDER BY
        sc.LastUpdateDate DESC
;

EXEC spStudentProgress '429d84eb-979c-4ee9-a8d3-b7a438d92836';