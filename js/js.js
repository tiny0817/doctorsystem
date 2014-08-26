


function form_submit(){
//	alert('ok');
	document.getElementById("login").submit();
//	alert('ok');
	return true;
	
}

function form_reset(){
//	alert('ok');
	document.getElementById("login").reset();
}

function reloadcode(){
    var verify=document.getElementById('safecode');
    verify.setAttribute('src','code.php?'+Math.random());
}