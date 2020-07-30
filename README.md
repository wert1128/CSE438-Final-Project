# CSE438-Final-Project

Student ID's

474206,472956

Known Limitation:
  1. Comments submitted anonymously cannot be deleted.
  2. Due to lack of API for washu course page, we had to input data into the database by hand. Therefore, only a very limited amount of courses are on the app, and only part of them have detail data.
  3. IMPORTANT!!! The Computer Science Department and the African Studies Department are the two department that are data-complete. Use them for your testing.
  4. Upvoting and downvoting comments do not take into account of who has voted, so it is there more for the comment sorting functionality.
  5. Because we cannot confirm the identity of the professor for now, the professor authority is abusable.
  
Usage:
To use this project, clone the repo, and cd to the directory of this repo and in terminal.
Enter the command: 'pod install'
if you don't have pod, download pod before calling the command

Log In Section Functionalities:
The Log In Section is set to login on default and allow users to login using email and username. The dropdown menu on the top allows the user to change switch to professor sign up and student signup. The menu also allows the user to switch back to login. The login and signup interface provides proper feedback in the form of alert when the user enters the wrong password/inappropriate username etc. When Signing up, you have to provide a name, an email and a password. The users are divided into two types, the student and professor. The professor will have every functionality a student has, but has the ability to edit some courses in which you are the instructor of (your name that you sign up with matches the name of the instructor of the course.)

Search/Department Section Functionalities:
After Log In, you will be redirected into a page with a search bar, scroll view and a stackview of buttons to select the school you want to view. If you are a professor, you will have an additional button too edit all your classes. The search bar will allow you to search courses by name, the search result will contain every course from every school and department. (It will be very limited, because we do not have a lot of courses in the database.) The school names at the bottom will allow you to view lists of department from that school. By default, the school is set to Arts&Sciences. By clicking on one of the department, you will see the list of courses from that department. (Only some department contains courses due to limitation described above.) Both search and clicking on department will lead you to another view, and clicking on a specific course will allow you to see the detail information of the course.

Professor Functionalities:
