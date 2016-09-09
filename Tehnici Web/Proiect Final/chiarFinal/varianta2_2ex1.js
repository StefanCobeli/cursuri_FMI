

///////////////varianta2_2ex1



var lista = document.getElementById("parinte");
var copii = lista.children;
//alert("ceva");

var faCeva = function( ){
  
 alert( this.innerHTML );
  
};


  for( var i = 0; i < copii.length; i++ ){    
    //alert("ceva");
    if( copii[i].className == "click" ){
      copii[i].addEventListener( "click", faCeva ); 
      continue;
    }
    copii[i].addEventListener("click", function(){  return alert("nu"); } );
  }  



