# Rideshare Rails

<!-- Instructors: The checkmarks are already there, so just delete them for any line items that aren't met. -->

## Major Learning Goals/Code Review

<!-- Instructors: Feel free to practice creating specific feedback by referencing a line of code if you'd like. For example, you may say something like "nice custom method in `calculator.rb` line 42." This is optional. -->

<!-- 
Reflection Q answers:

Describe the types of entity relationships you set up in your project and why you set up the relationships that way:
Driver - Trip: One to many
Passenger - Trip: One to many

Describe the role of model validations in your application:
Prevents db from saving invalid data. May mention user experience.

All other questions are qualitative.
-->

| Criteria | yes/no, and optionally any details/lines of code to reference |
| --- | --- |
| Practices collaborating with git, and all team members contribute git commits and best git practices | ✔️?
| Demonstrates understanding of relationships by giving accurate answers to the reflection questions and appropriate code in the models | ✔️?
| Logic to calculate a driver's average rating and total earnings is located in the model, and it has unit tests | ✔️?
| There are reasonable tests to test the validation requirements for all models | ✔️?
| There are reasonable tests to test the relationship requirements for all models | ✔️?
| There are reasonable tests to test the controller actions for all controllers | ✔️?
| The app has an attractive and usable user interface | ✔️?
| The app uses/is compatible with database seeds | ✔️?
| Router code is clean: uses `resources` and RESTful routes | ✔️?

## Functional Requirements

| Functional Requirement | yes/no |
| --- | --- |
| On the passenger's details page, I want to be able to see total charged, list of trips, a link to edit, and delete | ✔️?
| When adding a new passenger, I want to see errors and validations that show that a passenger must be provided a name and a phone number, so that I cannot make a passenger without name or phone number | ✔️?
| On the passenger's details page, I can create a new trip for this passenger, with an assigned driver and no rating | ✔️?
| On the driver's details page, I want to be able to see total earnings, average rating, list of trips, a link to edit, and delete | ✔️?
| When adding a new driver, I want to see errors and validations that show that a driver must be provided a name and VIN, so that I cannot make a driver without name or VIN | ✔️?
| On the trip's detail page, I want to be able to view details, assign a rating, navigate to the trip's passenger, driver, a link to edit, and delete | ✔️?

## Overall Feedback

| Overall Feedback | Criteria | yes/no |
| --- | --- | --- |
| Green (Meets/Exceeds Standards) | 8+ in Code Review && 5+ in Functional Requirements | 
| Yellow (Approaches Standards) | 5+ in Code Review && 4+ in Functional Requirements, or the instructor judges that this project needs special attention | 
| Red (Not at Standard) | 0-4 in Code Review or 0-3 in Functional Reqs, or assignment is breaking/doesn’t run with less than 5 minutes of debugging, or the instructor judges that this project needs special attention | 

<!-- ### Additional Feedback -->

<!-- Instructors, feel free to ignore this section if there's nothing else to add. -->

## Code Style Bonus Awards

<!-- Instructors: Please strike a balance between liberal/stingy with these. These are simply built-in pieces of positive feedback; use this to encourage and push students towards a cleaner code style! -->

Was the code particularly impressive in code style for any of these reasons (or more...?)

| Quality | Yes? |
| --- | --- |
| Perfect Indentation | ✅
| Elegant/Clever | ✅
| Descriptive/Readable | ✅
| Concise | ✅
| Logical/Organized | ✅