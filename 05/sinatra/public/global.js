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
    link.innerHTML = "Mark As " + this.response;
    link.setAttribute("href", ("/tasks/mark_as_" + this.response + "/" + database_id));
  });
  
  done_request.send();
}








var finishLinks = document.getElementsByClassName("done_link");

for (var i=0; i < finishLinks.length; i++) {
  // finishLinks[i] represents each of the items in `finishLinks`. 
  finishLinks[i].addEventListener("click", mark_done_or_undone);
  
}