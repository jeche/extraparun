Models
======
Routes
======
String p1_x

String p1_y

String p2_x

String p2_y

String distance

Runs
====
String runId

String hr

String min

String sec

String date

Users
=====
String name

String email

String password_digest

To create a User model you need the following:

    User(name, email, password, password_confirmation)

When creating the User model it will then check that password and password confirmation match.  The two must match in order for it to create the user.  Email must match the standard format of xxxx@xxxxx.xxx.
