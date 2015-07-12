You are given:

1. A Sinatra application with a homepage.
2. Two files in **/public**.
  - A file called "info1" that has `yes` in it.
  - A file called "info2" that has `no` in it.
3. A JavaScript file that runs when the homepage is viewed.
  - The JS file creates and sends a request to "/info1" using XHR.
  - When the response is received, nothing happens [yet].

For this atomic, you will need to modify only the JavaScript file.

# Exercise 1

When the response is received, show an alert containing the response.

If you succeed, the alert should show `yes`.

# Exercise 2

Change the path of the request so that the alert shows `no` instead.

# Exercise 3

If the response received is `"yes"`, then `alert("Yay!")`.

Otherwise `alert("Aw, shucks!")`.

Now you can change the path of the request whenever you want, and the alert will accommodate either response.

---

# Questions

Write answers to these questions in the **home.erb** file - sort of like how you did it for the JavaScript Atomics earlier this week.

1. Why are you able to make requests to **/info1** and **/info2** even though there are no route handlers for those paths defined in **app.rb**?
2. Why is the XHR object's request path **/info1** instead of **/public/info1**?
3. Within the `addEventListener` function, what does `this` represent?