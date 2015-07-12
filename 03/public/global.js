
//  ---------------------------------------------------------------------------

var myLink = document.getElementById("clicker");

var handleTheClick = function(event){
  // ?????????
  element = this;
  var req = new XMLHttpRequest();

  req.open("get", this.getAttribute("href"));

  req.addEventListener("load", function(){
    // alert(this.response);
    element.innerHTML=this.response;
  });

  req.send();
  // Prevent the link from refreshing the DOM.
  event.preventDefault();
}

// When the link is clicked, run the above code.
myLink.addEventListener("click", handleTheClick);