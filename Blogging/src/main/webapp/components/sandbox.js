/*const inputs = document.querySelectorAll('input');

const patterns = {
	pass : /^[\w@-]{8,20}$/
};

function validate(field,regex){
	if(regex.test(field.value)){
		field.className ='valid';
	}else{
		field.className ='invalid';
	}
}

inputs.forEach((input) => {
	input.addEventListener('keyup',(e) =>{
		validate(e.target, patterns[e.target.attributes.name.value])
	});
});


*/

function cleartxt(){
	document.getElementsByName('title')[0].value = '';
	document.getElementsByName('content')[0].value = '';
	
}



