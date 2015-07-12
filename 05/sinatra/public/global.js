
function id_of_link(link){
  return link.getAttribute("data-task-id");
}

function mark_done(){
  database_id = id_of_link(this);
  a_link = this;
  
  done_request = new XMLHttpRequest();
  done_request.open("get", "/tasks/mark_as_done/" + database_id);
  
  done_request.addEventListener("loadstart", function(){
    console.log("Starting to mark done for " + database_id);
  });
  
  done_request.addEventListener("load", function(){
    if (this.response == "Done!") {
      a_link.classList.add("finished");
    }
    else {
      alert("Something happened.  Your change was not saved.  Try again.")
    }
  });
  
  
}

var finishLinks = document.getElementsByClassName("done_link");

for (var i=0; i < finishLinks.length; i++) {
  // finishLinks[i] represents each of the items in `finishLinks`.
  
  finishLinks[i].addEventListener("click", mark_done);
  
}