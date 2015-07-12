var req = new XMLHttpRequest();

// For 'Exercise 2', you will modify this line:
// req.open("get", "/info1");
//Now for Exercise 2, changing this line
req.open("get", "/info2")


req.addEventListener("loadstart", function(){
  console.log("loadstart");
});

req.addEventListener("load", function(){
  // Your code for Exercise 1 goes here.
  
  //Exercise 1 - alert should show containing the response.
  // alert(this.response);
  //Exercise 3 - alert should be yay if yes or aw shucks if not
  if (this.response == "yes") {
    alert("yay!");
  }
  else {
    alert("Aw, shucks!")
  }
  
});

req.send();
