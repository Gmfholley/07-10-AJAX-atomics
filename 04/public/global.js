var myLink = document.getElementById("clicker");

function get_text_from_input_field(id){
  return document.getElementById(id).value;
}


var handleTheClick = function(event){
  var thisLink = this;
  
  var req = new XMLHttpRequest();

  req.open("get", "/" + get_text_from_input_field("word"));

  req.addEventListener("load", function(){    
    thisLink.innerHTML = this.response;
  });

  req.send();
  
  // Prevent the link from refreshing the DOM.
  event.preventDefault();
}

// When the link is clicked, run the above code.
myLink.addEventListener("click", handleTheClick);