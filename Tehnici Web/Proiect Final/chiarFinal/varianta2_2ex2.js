/////////////








//////////varianta2_2ex2
var counter = 1 ;
var buton = document.getElementById( "ceva" );
var apa = function(){ alert("alta"); };

buton.onclick = function(){ alert("alt"); };


document.addEventListener("click", function(event){
  
  var butonNou = document.createElement("button");
  butonNou.style.position = "fixed";
  butonNou.style.left = event.offsetX + "px";
  butonNou.style.top = event.offsetY + "px";
 // alert(event.screenX);
//  butonNou.value = counter;
  butonNou.innerHTML = counter;
  counter++;
  document.body.appendChild(butonNou);
  setTimeout( function(){   document.body.removeChild(butonNou);}, 10000);
  
});


