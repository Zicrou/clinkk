function getIDTypePaiment() {
  var typepaimentid = document.getElementById("comptabilite_type_paiment_id").value
  var ipm = document.getElementById("ipm");
  
  if (typepaimentid == "") {
    //pourcentage_ipm.style.display = "none";
    ipm.style.display = "none";
  } else if (typepaimentid == "1") {
    ipm.style.display = "none";
    //pourcentage_ipm.style.display = "none";
  } else if (typepaimentid == "2") {
    ipm.style.display = "block";
    //pourcentage_ipm.style.display = "block";
  }
 
}