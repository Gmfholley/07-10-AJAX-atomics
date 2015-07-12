You are given:

1. A Sinatra application with a homepage and one other route handler.
  - The other route handler is for a very generic path. It will match any route that follows this pattern: `/anythingatall`. E.g. `/whatever` and `/this_too` will both also match the route pattern.
2. A JavaScript file that runs when the homepage is viewed.
  - The JS file attaches a click-handler to a link on the page.
    - When the link is clicked, an XHR object is created that sends a request to "/hey_there".
  - When the response is received, the click's linked text changes to `You wrote hey_there`.
  
The homepage has an input field on it as well. That's not used or relevant until 'Exercise 2' below.

There is also a view file called "message.erb" that is not used until the very end.

# Exercise 1

Change the XHR object's request path to something else (like `"whats_up"`). Verify that the resulting text of the link, when you click it, changes accordingly.

# Exercise 2

Currently, the XHR object's path is hard-coded. Change the code so that the path is based on whatever the user types into the input field (The one with an ID of `word`).

So if the user types `strawberry` into the field, the XHR object's path should become `"/strawberry"`. And the link's text should change accordingly.

(There is a solution file, if you need it.)

# Exercise 3

Modify the *controller action* (in **app.rb**) so that it satisfies the following requirements:

1. If the message the user typed in has an uppercase first letter (e.g. "Judy"), return: `"You wrote Judy. Is that someone's name?"`.
2. If the message the user typed in begins with a number (e.g. "40"), return `"You wrote 40. Is that how old you are?"`.
3. Otherwise (e.g. "tabletop"), return `"You wrote tabletop. Whatever."`.

(There is a solution file, if you need it.)

# Exercise 4

Modify the controller action so that it returns `erb :"message"` instead of returning the strings you've prepared.

Open **views/message.erb** and notice that it simply returns the value of `@response_message`.

Now modify your controller action so that - instead of returning a string - it sets `@response_message` to a particular string.

This won't change the functionality of the program from 'Exercise 3' at all. It's simply delegating the response text from the controller action to the controller action's view.

(There is a solution file, if you need it.)