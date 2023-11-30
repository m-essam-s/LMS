# Learning Management System Database [`Mohamed Essam`](https://github.com/m-essam-s)

## Database Design Requirements List 

- Course information includes a course code (unique identifier), a course name or title, start/end dates, course category, course abstract, and bibliography. The course category must belong to a list of predetermined categories.
- Students’ registrations must contain their names and email addresses. Other data, such as date of birth and telephone number, can optionally be registered.
- `Teachers’` registration must contain their names and email addresses. Optionally, their telephone numbers can also be included.
- A teacher can teach more than one course, and more than one teacher can teach one course.
- Each student can enroll in one or more courses. When a student enrolls in a course, the date of enrollment is registered.
- A student’s enrollment in a course can be canceled. In that case, the reason for cancellation is registered.
- A course consists of a certain number of classes, which are numbered sequentially. Each class is held on a specific date and at a specific time. Each class must have a descriptive title of the subject it covers.
- `Students’` attendance in class needs to be registered for each person. The time of arrival and time of departure should be saved in the attendance records.
- A course can have an arbitrary number of tests or exams, numbered sequentially. For each exam, the database should store the date and time it is taken and the topics it covers.
- The database should keep a record of each time a student takes a test, storing the score obtained.

![ER-D](./EntityRelationshipDiagram.svg)
## Database Implementation
- [SQL Code](./LMS.sql)
