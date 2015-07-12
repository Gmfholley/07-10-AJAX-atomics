# Exercise 1

Acquaint yourself with this Sinatra project. What is its purpose? What are the various files used for? View the source of the homepage. How is that HTML being generated?

# Exercise 2

Open **public/global.js**. Add code to the loop I've prepared for you. The code should achieve the following overarching goal: It should mark a task as finished.

---

There are smaller steps you might take to achieve that larger goal. Consider implementing the following in order:

1. Set a `var` equal to the link's `href` attribute.
2. Make an XHR object that sends a request to that path.

At this point, if you refresh the page, you will find that the completed tasks are crossed off. This is due to the addition of the `finished` class, which has that style being defined in **global.css**.

But it requires a page-refresh to reload the view code. We can solve this by updating the DOM to match the updated view code whenever the response comes back.

For the XHR object's `load` event, implement the following:

1. Using the value of the clicked link's `data-task-id` attribute, get the link's parent `<li>` element. You should be able to get the `<li>` by its ID.
2. Modify the `class` attribute of the `<li>` so that it is `task finished` - not just `task`.
3. Remove the clicked link DOM element entirely.

Now, when the response comes back from the server, the DOM is modified to reflect the change. Refreshing the page also works, because that view code is generated according to what's in the database at that time.

# Stretches

These are optional and don't have much detail. You'll need to think about how the feature should be implemented.

1. Should be able to **undo** marking a task complete.
2. Should be able to add a new task (using AJAX!) from the homepage.