// returns the id of the link (which is an Integer)
//
// returns an Integer
function id_of_link(link){
  return link.getAttribute("data-task-id");
}
// returns whether the link is done or undone
//
// returns a String of the href Attribute
function done_or_undone(link){
  return link.getAttribute("href");
}

// capitalizes the s String
//
// s - String
//
// returns a String
function capitalize(s)
{
    return s[0].toUpperCase() + s.slice(1);
}

// returns the new link for the anchor tag
//
// done_or_undone - String in English
// id - Integer of the element Id
//
// returns a String
function new_done_or_undone_link(done_or_undone, id){
  return ("/tasks/mark_as_" + done_or_undone + "/" + id);
}


// prevents anchors from going to a new page
// calls the method to run on the task according to the current link (Mark done or undone)
// toggles css class to strikethrough if done
// after done, updates link to do opposite (done/undone)
//
// event - Event object
//
// retrns nothing
function mark_done_or_undone(event){
  event.preventDefault();
  
  var link = this;
  var database_id = id_of_link(this);
  var task_li = document.getElementById("task" + database_id);
  var http_url = (done_or_undone(link));

  var done_request = new XMLHttpRequest();
  
  done_request.open("get", http_url);
  
  done_request.addEventListener("loadstart", function(){
    console.log("Starting to " + done_or_undone(link) + " for " + database_id);
  });
  
  done_request.addEventListener("load", function(){
    task_li.classList.toggle("finished");
    link.innerHTML = "Mark As " + capitalize(this.response);
    link.setAttribute("href", new_done_or_undone_link(this.response, database_id));
  });
  
  done_request.send();
}






// Adds event listeners to all done_link anchors
var finishLinks = document.getElementsByClassName("done_link");

for (var i=0; i < finishLinks.length; i++) {
  // finishLinks[i] represents each of the items in `finishLinks`. 
  finishLinks[i].addEventListener("click", mark_done_or_undone);
  
}