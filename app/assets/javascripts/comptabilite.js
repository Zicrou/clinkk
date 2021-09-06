function getIDTypePaiment() {
  var typepaimentid = document.getElementById("comptabilite_type_paiment_id").value
  var ipm = document.getElementById("ipm");
  var montant = document.getElementById("montant");
  if (typepaimentid == "1") {
    montant.style.display = "block";
    ipm.style.display = "none";
  } else if (typepaimentid == "2") {
    ipm.style.display = "block";
    montant.style.display = "none";
  }
 
}