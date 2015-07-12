var req = new XMLHttpRequest();

// For 'Exercise 2', you will modify this line:
// req.open("get", "/path1");
req.open("get", "/path1");


req.addEventListener("loadstart", function(){
  console.log("loadstart");
});

req.addEventListener("load", function(){
  // Your code for Exercise 1 goes here.
  if (this.response == "yes") {
    alert("yay!");
  }
  else {
    alert("Aw, shucks!")
  }
});

req.send();
