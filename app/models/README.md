Models
======
Routes
======
Integer route_id

Integer run_id

Integer numPoints

String distance

Points
=====
Integer point_id

Float lat

Float lon

Integer route_id

Runs
====
Integer run_id

String name

String date

String dist

String humidity

String temp

String hr

String min

String sec

String date

Integer user_id

Goals
=====
Integer goal_id

String GoalName

String Goaltime

String Route

Integer user_id

Users
=====
Integer user_id

String name

String email

String password_digest

String remember_token

To create a User model you need the following:

    User(name, email, password, password_confirmation)

When creating the User model it will then check that password and password confirmation match.  The two must match in order for it to create the user.  Email must match the standard format of xxxx@xxxxx.xxx.

A user has runs and goals.  Each run has a route and each route has many points.
