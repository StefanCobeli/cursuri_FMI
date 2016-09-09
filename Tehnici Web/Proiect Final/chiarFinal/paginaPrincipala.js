

function checkBoxAction(list){

  list.addEventListener("change", function() {
    var my_checkbox = this.childNodes[1];
    if(my_checkbox.checked) {
      completedTasksHolder.appendChild(this);
    }
    else {
      incompleteTasksHolder.appendChild(this);
    }
  });
  
  
}



var taskInput = document.getElementById("new-task");
var addButton = document.getElementById("addButton");
var incompleteTasksHolder = document.getElementById("incomplete-tasks");
var completedTasksHolder = document.getElementById("competed-tasks");





var addButtonFunction = function(){
  
  var action = document.getElementById("new-task").value;
  incompleteTasksHolder.appendChild( createNewTask( action ) );
  
  
};

addButton.addEventListener("click",addButtonFunction);


/////////////checkBox action
var inputs = document.getElementsByTagName("input");

for(var i = 0; i < inputs.length; i ++){
  var element = inputs[i];
  
  if(element.type == "checkbox"){
    checkBoxAction(element.parentElement);
  }
  
  
}



var createNewTask = function( action ){
  console.log("intrat");
  var listItem = document.createElement("li");
  var checkBox = document.createElement("input");
  var label = document.createElement("label");
  var editInput = document.createElement("input");
  var editButton = document.createElement("button");
  var deleteButton = document.createElement("button");
    
  listItem.appendChild( document.createElement("b") );
  listItem.appendChild( checkBox );
  listItem.appendChild( label );
  listItem.appendChild( editInput );
  listItem.appendChild( editButton );
  listItem.appendChild( deleteButton );
  editButton.className = "edit" ;
  deleteButton.className = "delete" ;
  checkBox.type = "checkBox";
  editButton.innerText = "Edit";
  deleteButton.innerText = "Delete";
  deleteButton.addEventListener( "click", deleteTask );
  label.innerHTML = action;
  checkBoxAction(listItem);
  return listItem;  
  
};

var deleturi = document.getElementsByClassName("delete");
 for( var i = 0; i < deleturi.length; i++ ){
   console.log("am ajuns");
    deleturi[i].addEventListener( "click", deleteTask );
   
 }

function deleteTask( ){
  
  console.log("deleting");
  var parent = this.parentElement;
  console.log(parent.parentElement.tagName);
  parent.parentElement.removeChild(parent);
  
}






