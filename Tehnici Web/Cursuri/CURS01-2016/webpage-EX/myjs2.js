
 
window.onload = myMain;

function myMain() {
//document.forms.quiz.onsubmit
 document.getElementById("buton").onclick = totalQuiz;
}

/*
function adaugaText() {
document.getElementById('nou').innerHTML = '<span style="color:blue;background-color:yellow;"> Text adaugat cu JS </span>';
} // nu e bine; vom face la DOM

*/


function totalQuiz() { 
var q1 = document.forms.quiz.q1;
var q2 = document.forms.quiz.q2;
var x = 0;
for (var i = 0; i<q1.length; i++) if (q1[i].checked) x = x + parseInt(q1[i].value); 
for (var i = 0; i<q2.length; i++) if (q2[i].checked) x = x + parseInt(q2[i].value); 

if (x > 1) {alert( "Felicitari!\n"+x+" raspunsuri corecte");} 
else if (x == 1) {alert( "Felicitari!\n un raspuns corect");} else {alert( "Nici un raspuns corect" );} ;

}

// onclick="alert(checkEdu(whichChecked(document.edu.platform)))"