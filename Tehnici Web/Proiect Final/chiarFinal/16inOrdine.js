



document.addEventListener('DOMContentLoaded', function () {


  creareTabel();
});


function creareTabel(){


  console.log("se ruleaza");  
  var table = document.getElementById("tabel");
  for (var i = 1; i <= 4; i ++) {
    var tr = document.createElement("tr");
    tr.setAttribute("id", "row_" + i);
    for (var j = 1; j <= 4; j ++) {
      var td = document.createElement("td");
      td.setAttribute("id", "cell_" + i + "_" + j);
      tr.appendChild(td);
    }
    table.appendChild(tr);
  }
  
  var casutaD = document.getElementById("cell_"+1+"_"+4);
  var casutaC = document.getElementById("cell_"+3+"_"+2);
  var casutaB = document.getElementById("cell_"+2+"_"+4);
  var casutaA = document.getElementById("cell_"+1+"_"+3);

  casutaA.innerText = "1";

  casutaB.innerText = "2";
  casutaC.innerText = "4";
  casutaD.innerText = "8";
  

}


function getCell( pozitieI, pozitieJ ){

  return document.getElementById("cell_"+pozitieI+"_"+pozitieJ);
  
}

//Push a
function tranzitieStanga(){
  for(var i = 1; i <= 4; i ++) {
    var primaGoala = 1;
    for( var j = 1; j <= 4; j++ ){
        var casuta = getCell(i, j);
        if( casuta.innerText !== "" ){

          var casutaNoua = getCell(i,primaGoala);
          var aux = casuta.innerText;
          casuta.innerText = "";
          casutaNoua.innerText = aux;
          primaGoala++;

        }


  }
}
 //  for(var i = 1; i <= 4; i ++) {
 //   var casuteGoale = 0;
 //   for( var j = 1; j <= 4; j++ ){
 //     var casuta = getCell(i,j);
 //     if(typeof(casuta.innerText)) {
 //       if( casuta.innerText === "" ){

 //         casuteGoale++;

 //       }else{

 //         var pozitieNoua = j - casuteGoale;
 //         console.log(i + " " + pozitieNoua);
 //         var casutaNoua = getCell(i,pozitieNoua);
 //         casutaNoua.innerText =  casuta.innerText;
 //         casuta.innerText = "";

 //       }

 //     }
 //   }
 //   console.log(casuteGoale);

 // }
}         
function tranzitieDreapta() {
  for(var i = 1; i <= 4; i ++) {
    var primaGoala = 4;
    for( var j = 4; j >= 1; j-- ){
        var casuta = getCell(i, j);
        if( casuta.innerText !== "" ){

          var casutaNoua = getCell(i,primaGoala);
          var aux = casuta.innerText;
          casuta.innerText = "";
          casutaNoua.innerText = aux;
          primaGoala--;

        }
    }
  }
}
//  for(var i = 1; i <= 4; i ++) {
//    var casuteGoale = 0;
//    for( var j = 4; j >= 1; j-- ){
//      var casuta = getCell(i,j);
//      if(typeof(casuta.innerText)) {
//        if( casuta.innerText === "" ){

//          casuteGoale++;

//        }else{

//          var pozitieNoua = j + casuteGoale;
//          console.log(i + " " + pozitieNoua);
//          var casutaNoua = getCell(i,pozitieNoua);
//          casutaNoua.innerText =  casuta.innerText;
//          casuta.innerText = "";
//          console.log(i+" "+j);

//        }

//      }
//    }
//  }


// }

function tranzitieSus(){
  for(var i = 1; i <= 4; i ++) {
    var primaGoala = 1;
    for( var j = 1; j <= 4; j++ ){
        var casuta = getCell(j, i);
        if( casuta.innerText !== "" ){

          var casutaNoua = getCell(primaGoala, i);
          var aux = casuta.innerText;
          casuta.innerText = "";
          casutaNoua.innerText = aux;
          primaGoala++;

        }
    }
  }


}
function tranzitieJos(){

  for(var i = 1; i <= 4; i ++) {
    var primaGoala = 4;
    for( var j = 4; j >= 1; j-- ){
        var casuta = getCell(j, i);
        if( casuta.innerText !== "" ){

          var casutaNoua = getCell(primaGoala, i);
          var aux = casuta.innerText;
          casuta.innerText = "";
          casutaNoua.innerText = aux;
          primaGoala--;

        }
    }
  }



}

document.addEventListener('keypress', function(event) {

switch(event.keyCode) {
  case 119: // w
    tranzitieSus(); 
    break;
  case 97: // a
    tranzitieStanga();
    break;
  case 115: // s
    tranzitieJos();
    break;
  case 100: // d
    tranzitieDreapta();
    break;
 }

});
//////////////Pana aici se poate folosi pentru tabloul cu 4x4 si sa le pui in ordine
