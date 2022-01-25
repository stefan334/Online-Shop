window.addEventListener("DOMContentLoaded", function() {

    // -------------------- selectare produse cos virtual----------------------------------
    /*
        indicatie pentru cand avem cantitati
        fara cantitati: "1,2,3,4" //1,2,3,4 sunt id-uri
        cu cantitati:"1:5,2:3,3:1,4:1" // 5 produse de tipul 1, 3 produse de tipul 2, 1 produs de tipul 3...
        putem memora: [[1,5],[2,3],[3,1],[4,1]]// un element: [id, cantitate]

    */
    ids_produse_init = localStorage.getItem("produse_selectate");
    if (ids_produse_init)
        ids_produse_init = ids_produse_init.split(","); //obtin vectorul de id-uri ale produselor selectate  (din cosul virtual)
    else
        ids_produse_init = []

    var checkboxuri_cos = document.getElementsByClassName("select-cos");
    for (let ch of checkboxuri_cos) {
        if (ids_produse_init.indexOf(ch.value) != -1)
            ch.checked = true;
        ch.onchange = function() {
            ids_produse = localStorage.getItem("produse_selectate")
            if (ids_produse)
                ids_produse = ids_produse.split(",");
            else
                ids_produse = []
            console.log("Selectie veche:", ids_produse);
            //ids_produse.map(function(elem){return parseInt(elem)});
            //console.log(ids_produse);
            if (ch.checked) {
                ids_produse.push(ch.value); //adaug elementele noi, selectate (bifate)
            } else {
                ids_produse.splice(ids_produse.indexOf(ch.value), 1) //sterg elemente debifate
            }
            console.log("Selectie noua:", ids_produse);
            localStorage.setItem("produse_selectate", ids_produse.join(","))
        }
    }
});


window.onkeydown = function(e) {
    console.log(e);
    if (e.key == "c" && e.altKey == true) {
        var suma = 0;
        var articole = document.getElementsByClassName("produs");
        for (let art of articole) {
            if (art.style.display != "none")
                suma += parseFloat(art.getElementsByClassName("val-pret")[0].innerHTML);
        }

        var spanSuma;
        spanSuma = document.getElementById("numar-suma");
        if (!spanSuma) {
            spanSuma = document.createElement("span");
            spanSuma.innerHTML = " Suma:" + suma; //<span> Suma:...
            spanSuma.id = "numar-suma"; //<span id="..."
            document.getElementById("p-suma").appendChild(spanSuma);
            setTimeout(function() { document.getElementById("numar-suma").remove() }, 1500);
        }
    }


}