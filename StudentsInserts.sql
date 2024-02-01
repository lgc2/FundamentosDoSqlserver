SELECT * FROM Student;
SELECT * FROM StudentCourse;
-- SELECT NEWID();
SELECT * FROM Course WHERE Tag = '2803';

INSERT INTO
    Student (Id, Name, Email, Document, Phone, Birthdate, CreateDate)
VALUES
    (
        '429d84eb-979c-4ee9-a8d3-b7a438d92836',
        'André Baltieri',
        'hello@balta.io',
        '12345678901',
        '12345678',
        NULL,
        GETUTCDATE()
    );

INSERT INTO
    StudentCourse (CourseId, StudentId, Progress, Favorite, StartDate, LastUpdateDate)
VALUES
    (
        '5f5a33f8-4ff3-7e10-cc6e-3fa000000000',
        '429d84eb-979c-4ee9-a8d3-b7a438d92836',
        50,
        0,
        '2020-01-13 12:35:54',
        GETDATE()
    );