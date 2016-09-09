 
window.onload =  myMain;

function myMain() {
document.getElementById("buton").onclick = function (){
             var x = prompt("nr ="); suma(parseInt(x));}
}


function suma(x) {
if (isNaN(x)) {alert("input gresit")}
else {
  var s = 0; 
  for (let i=1; i<= x ; i++) s=s+i;
  alert('Suma este ' +  s); 
}
}



