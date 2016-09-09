



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
  
 
  

}


function getCell( pozitieI, pozitieJ ){

  return document.getElementById("cell_"+pozitieI+"_"+pozitieJ);
  
}

//Push a
function tranzitieStanga(){
  // ////Combinarea casutelor
  // parcurgem in ordinea de mai jos si cand gasesc doua 
  // la fel le combin in pozitia primului
for(var i = 1; i <= 4; i ++) {
    var ultimaPlina = 1;

    for( var j = 1; j <= 4; j++ ){
        var casuta = getCell(i, j);
        var casutaVeche;
        if( ultimaPlina == casuta.innerText){
          ultimaPlina = 1;
          casutaVeche.innerText = parseInt(casuta.innerText) * 2;
          casuta.innerText="";
        }
        if (casuta.innerText !== "") {
          casutaVeche = casuta;
          ultimaPlina = casuta.innerText;
      }
    }
  }



  ///Mutarea casutelor
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
generateRandomInformation();
}

       
function tranzitieDreapta() {
  for(var i = 1; i <= 4; i ++) {
    var ultimaPlina = 1;
    var casutaVeche;
    for( var j = 4; j >= 1; j-- ){
        var casuta = getCell(i, j);
        if( ultimaPlina == casuta.innerText){
          ultimaPlina = 1;
          casutaVeche.innerText = parseInt(casuta.innerText) * 2;
          casuta.innerText="";
        }
        if (casuta.innerText !== "") {
          casutaVeche = casuta;
          ultimaPlina = casuta.innerText;
      }
    }
  }

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
     generateRandomInformation();
}

function tranzitieSus(){
  for(var i = 1; i <= 4; i ++) {
    var ultimaPlina = 1;
    var casutaVeche;
    for( var j = 1; j <= 4; j++ ){
        var casuta = getCell(j, i);
        if( ultimaPlina == casuta.innerText){
          ultimaPlina = 1;
          casutaVeche.innerText = parseInt(casuta.innerText) * 2;
          casuta.innerText="";
        }
        if (casuta.innerText !== "") {
          casutaVeche = casuta;
          ultimaPlina = casuta.innerText;
      }
    }
  }

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


     generateRandomInformation();
}
function tranzitieJos(){
  for(var i = 1; i <= 4; i ++) {
    var ultimaPlina = 1;
    var casutaVeche;
    for( var j = 4; j >= 1; j-- ){
        var casuta = getCell(j, i);
        if( ultimaPlina == casuta.innerText){
          ultimaPlina = 1;
          casutaVeche.innerText = parseInt(casuta.innerText) * 2;
          casuta.innerText="";
        }
        if (casuta.innerText !== "") {
          casutaVeche = casuta;
          ultimaPlina = casuta.innerText;
      }
    }
  }


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



     generateRandomInformation();
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


var generateRandomInformation = function(){
  
  do{
    var pozitieI = Math.floor(Math.random()*10)%4 + 1;
    var pozitieJ = Math.floor(Math.random()*10)%4 + 1;
  }while( getCell(pozitieI,pozitieJ).innerText !== ""  )
  console.log( pozitieI+ " " +pozitieJ );

  var vector = [2,2,2,4];
  var info = vector[Math.floor(Math.random()*10)%4];

  getCell(pozitieI,pozitieJ).innerText = info;
}