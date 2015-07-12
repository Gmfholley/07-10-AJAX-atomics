You are given:

1. A Sinatra application with a homepage and one other route handler.
  - The homepage has a link with an ID of `clicker`. (It goes nowhere and does nothing [yet].)
2. A JavaScript file that runs when the homepage is viewed.
  - The JS file creates and sends a request to "/path1" using XHR.
  - When the response is received, an alert shows the response text.
  - There is also some starter JS for a click handler.

For this atomic, you will need to modify only the JavaScript file.

# Exercise 1

Currently, the XHR object is created and sent immediately when the page loads. That's kind of annoying.

Modify the JavaScript so that the XHR object is created and sent only when the link on the page (`myLink`, in the JavaScript) is clicked.

(There is a solution file, if you need it. This is a simple problem, so you might overthink it.)

# Exercise 2

The path of the XHR request is being hard-coded: `req.open("get", "/path1");`.

Use `this` to get the value of `myLink`'s `href` attribute. Set the path of the XHR request using that.

(There is a solution file, if you need it.)

## Reflection

You now have two occurrences of `this` in your event handler. In one case, `this` refers to the link being clicked. In the other case, `this` refers to the XHR object (`req`).

# Exercise 3

Modify the JavaScript so that, when the response is received, you no longer show an alert at all.

Instead, change the the text of the clicked link to "Response Received!".

Consider that you need a way to differentiate between `this` when it refers to the link and `this` when it refers to the request object.

(There is a solution file, if you need it.)

# Exercise 4

Instead of changing the link's text to "Response Received!", change it to the response's text. (So the link text should become `yes`.)

(There is a solution file, if you need it.)