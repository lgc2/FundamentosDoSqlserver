CREATE OR ALTER PROCEDURE spDeleteStudent (
    @StudentId UNIQUEIDENTIFIER
)
AS
    BEGIN TRANSACTION
        DELETE FROM StudentCourse WHERE StudentCourse.StudentId = @StudentId
        DELETE FROM Student WHERE Student.Id = @StudentId
    COMMIT;

-- EXEC spDeleteStudent '429d84eb-979c-4ee9-a8d3-b7a438d92836';