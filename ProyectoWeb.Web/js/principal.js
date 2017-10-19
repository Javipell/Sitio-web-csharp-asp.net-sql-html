$(document).ready(function ()
{
    var urlActual = window.location.toString().trim().toUpperCase
        ();
    if (urlActual.indexOf("GESTIONENTREVISTAS.ASPX") > 1 )
    {
        AceptaSoloNumerosEnteros("txtValoracion");
    }

})

function AceptaSoloNumerosEnteros(e) {
    var key = window.Event ? e.which : e.keyCode
    return (key >= 48 && key <= 57)
}