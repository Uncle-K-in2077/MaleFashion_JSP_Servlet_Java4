
function validate(){
	var fullname = document.getElementById('fullname').value;
	var gender = document.getElementById("gender").value;
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var rePassword = document.getElementById("rePassword").value;
	var email = document.getElementById("email").value;
	
	var errorName = document.getElementById("errorName");
	
	if (!fullname || !gender || !username || !password || !email) {
        alert("Please fill all lines");

        return false;
    }
    
    if(password != rePassword){
		alert("Your password does NOT match ");
		return false;
	}
	
    return true;
    
}