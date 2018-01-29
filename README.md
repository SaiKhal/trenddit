
## Unit 5 Group Project #2

## Overview

Using [Firebase](https://firebase.google.com/docs/ios/setup) as the backend for the app, you and your Group will build out a [Reddit](https://www.reddit.com/) like app that creates and views Posts from a social sharing community persepective.


## Groupwork

[Groups](https://docs.google.com/spreadsheets/d/1Yn8gLFB6hr33EoBptPgqBqvehTi8C12BKz22GfJ25_Q/edit#gid=1548238064)

Now that we have knowledge from our first Group project let's build upon those experiences. As before those are the collaboration requirements:

1. Git
2. Trello
3. Group Roles

### Git

Unlike homework in the past where you forked a C4Q repo, then committed and pushed at the end, a group project must be more colloborative.

Each group member should have their own *branch* with their name.  The *master* branch should only contain a working build of the project.  Each group member will work on their separate branches, then push their work to the master branch when they have completed a feature.  But how do you know what to work on?

### Trello

Each group member should have an account on [Trello](https://trello.com/) and the group should have a well maintained list of who is working on what task.  Without this, two people might try to edit the same file and create merge conflicts.

[Example](https://trello.com/b/DnZvFigA/agile-board)


### Group Roles

The expectation is that everyone in a group is chiefly occupied with writing code.  In addition to that, the following roles are important for someone to have explicit ownership of:

|Role|Responsibilities|
|:-------------:|:------------:|
| Technical Lead | In charge of maintaining the health of master branch and ensure that master is always safe to pull from.  Makes final decisions on project architecture in conversation with other team members |
| Project Manager | Is responsible for the health of the Trello or board.  Organizes daily standups |
| UI/UX | Is responsible for the design and flow of the app |
| QA | Is responsible for identifying bugs on master and that the final product is bug free |


## Gifs


**Github**
* Designate a team member to create a new Github Repo
* Create the following branches: ```prod``` ```qa``` and ```dev```
* ```prod``` - this is the production branch that we will be reviewing as your final project submission
* ```dev-group-member-name``` - this is your personal branch. Use this branch while working on your feature set. After you're done meet with team members to code review and merge your changes to the ```qa``` branch
* ```qa``` - this branch should be used for testing your app, QA (quality assurance) branch. After the team has reviewed and tested on the ```qa``` branch you group will then merge to the production branch ```prod```


## Rubric

This project will follow the [Cohort wide Rubric](https://github.com/C4Q/AC-iOS-Unit5Group2Project/blob/master/Access%20Code%204.0%20Project%20Evaluation%20Rubric%20-%20RUBRIC.pdf) along with the Rubric below:

|Architecture | Points|
|:----|:---|
|Variable Naming and Readability|4 Points|
|App uses AutoLayout correctly for all iPhones in portrait|4 Points|
|Proper Object Oriented Priciples are applied|4 Points|
|App uses MVC Design Patterns|4 Points|
|Proper use of Access Modifiers|4 Points|
|Proper use of Activity Indicators where applicable|4 Points|
|Keyboard Handling|4 Points|


|Managing Users with Firebase Authentication | Points|
|:----|:---|
|Can create a new user|2 Points|
|Can sign in user|2 Points|
|Can sign out user|2 Points|
|Users can reset password|2 Points|
|Users can verify account| 2 Points|


|Feed Tab | Points|
|:----|:---|
|Contains a Feed tab where all Posts are shown|4 Points|
|All posts are shown to the user with their current vote status|4 Points|
|Can vote up or down on a Post|4 Points|
|Can view details of a Post|4 Points|
|Can view all of the comments on a Post|4 Points|
|Create a new comment on a Post|4 Points|
|Can comment on a Post|4 Points|
|Can flag a Post|4 Points|
|Can flag a User|4 Points|

|Post Tab | Points|
|:----|:---|
|Contains a Tab where new Post are created|4 Points|
|Can create a Post|6 Points|
|For the Photo of the Post the user's photo libray or camera can be accessded|4 Points|
|A Post has a Photo, Title and Category|4 Points|


|Profile Tab | Points|
|:----|:---|
|Can view the user's Profile in the Profile Tab|4 Points|
|Can see all the user's submitted Posts|4 Points|
|Can update profile photo and display name|4 Points|
|Can update a Post|2 Points|
|Can delete a Post|2 Points|

|Group Specific | Points|
|:----|:---|
|Group Presentation|20 Points|
|Presentation Slides|10 Points|
|README|4 Points|
|Gif|4 Points|


|Github | Points|
|:----|:---|
|Each Group member created their own branch in this project|2 Points|
|Commits from Group members|4 Points|
|All branches were merged to ```master```|2 Points|


|Error Handling and Network Handling | Points|
|:----|:---|
|Loss of Network Handling|4 Points|
|Proper error handling and notification to user|4 Points|
|Use empty states in app|4 Points|


|Gestures and Animations | Points|
|:----|:---|
|Gestures are used as needed where uses expect such behavior|2 Points|
|Animations are included while using best practices|4 Points|

Total Points: 118 points

|Bonus Features | Points|
|:----|:---|
|Can view Submitted Post offline|4 Points|
|Uses [Core Data](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreData/index.html) for offline viewing|10 Points|
|Can delete user along with created content|4 Points|
|Can share Post to e.g email, facebook|4 Points|
