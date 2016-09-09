var counter = 1;
var imagine = document.getElementsByTagName("button")[0];
imagine.addEventListener( "click", function(){
  
  var interval =  
  setInterval( function(){
    imagine.innerHTML = "info"+counter; 
    console.log("info"+counter);
    
    counter++;  
  }, 1000);
  
  
  setTimeout( function(){ clearInterval(interval); }, 10000 );
  
  
});
