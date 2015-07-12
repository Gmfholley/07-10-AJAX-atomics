var req = new XMLHttpRequest();

req.open("get", "/path1");

req.addEventListener("load", function(){
  alert(this.response);
});

req.send();

//  ---------------------------------------------------------------------------

var myLink = document.getElementById("clicker");

var handleTheClick = function(event){
  // ?????????
  
  // Prevent the link from refreshing the DOM.
  event.preventDefault();
}

// When the link is clicked, run the above code.
myLink.addEventListener("click", handleTheClick);