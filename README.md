# birthday_calendar

## An application to keep track of your family/friends/collegues upcoming birthday.

The application consists of 4 screens : 
    -The main page is a list of upcoming birthdays. You can filter it by category and it is still sorted by upcoming birthday.
    -A add page. You can fill a form and add a new person to the hive.
    -A person/:id page. Displays some info about the person selected, and tells you the numbers of days before their birthday.
    -A calendar page. you can navigate through the calendar and see with color dots the birthdays that are coming. When clicking on a date, it displays underneath who's birthday it is.
    Under the calendar is some statistics : the number of family/friends/collegues that you have in the application.


## The application is available at the link : 

https://birthday-calendar-14aae.web.app/

## Running the application locally : 

Use the command 'flutter pub get' to install the dependencies.


## Structure of the project : 


I used a model-view-controller, with a service for interacting with the hive. I used GetX for reactivity.


## Responsivity

The application has 2 breakpoints at 640pixels and 768pixels. It modifies the buttons on the main page.

For desktop it is an AppBar with multiples buttons to filter and navigate.
For tablets it is a Drawer.
For mobile it is a BottomNavigationBar.

