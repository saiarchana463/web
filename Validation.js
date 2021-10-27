/**
 * 
 */

 function PhoneNoValidation()
{
  var phonePattern = /^\d{10}$/;
  var phoneNo = document.getElementsByName("phoneNo")[0];	
  if(phoneNo.value.match(phonePattern))
     {
	   return true;
	 }
   else
     {
	   alert("Not a valid Phone Number");
	   return false;
     }
}
 
