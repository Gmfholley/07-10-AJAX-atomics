// returns the id of the link (which is an Integer)
//
// returns an Integer
function id_of_link(link){
  return link.getAttribute("data-task-id");
}



function mark_done(event){
  event.preventDefault();
  
  var link = this;
  var database_id = id_of_link(this);
  var task = document.getElementById("task" + database_id);
  
  var done_request = new XMLHttpRequest();
  done_request.open("get", "/tasks/mark_as_done/" + database_id);
  
  done_request.addEventListener("loadstart", function(){
    console.log("Starting to mark done for " + database_id);
  });
  
  done_request.addEventListener("load", function(){
    if (this.response == "Done!") {
      task.classList.add("finished");
      link.innerHTML = "";
    }
    else {
      alert("Something happened.  Your change was not saved.  Try again.")
    }
  });
  
  done_request.send();
}








var finishLinks = document.getElementsByClassName("done_link");

for (var i=0; i < finishLinks.length; i++) {
  // finishLinks[i] represents each of the items in `finishLinks`. 
  finishLinks[i].addEventListener("click", mark_done);
  
}