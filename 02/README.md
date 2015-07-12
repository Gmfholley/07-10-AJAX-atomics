You are given:

1. A Sinatra application with a homepage and some other route handlers.
2. A JavaScript file that runs when the homepage is viewed.
  - The JS file creates and sends a request to "/path1" using XHR.
  - When the response is received, nothing happens [yet].

For this atomic, you will need to modify only the JavaScript file.

You should find that your JavaScript from the first atomic works (possibly exactly, but also possibly with some minor changes - depending on how you implemented it).

# Exercise 1

When the response is received, show an alert containing the response.

If you succeed, the alert should show `yes`.

# Exercise 2

Change the path of the request to `"/path2"`. Before running the new code, can you figure out what the alert will show? You should be able to figure this out merely by looking in this Sinatra project's files.

# Exercise 3

If the response received is `"yes"`, then `alert("Yay!")`.

Otherwise `alert("Aw, shucks!")`.

Now you can change the path of the request whenever you want, and the alert will accommodate either response.

---

# Questions

Write answers to these questions in the **home.erb** file - sort of like how you did it for the JavaScript Atomics earlier this week.

1. What is the difference between this atomic and the first atomic?

(That's the only question.)