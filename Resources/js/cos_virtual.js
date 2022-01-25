window.addEventListener("load", function() {
    // 	var myHeaders = new Headers();
    // myHeaders.append();
    var prod_sel = localStorage.getItem("produse_selectate")


    if (prod_sel) { //p.then(f1).then(f2).then(f3)
        var vect_ids = prod_sel.split(",");
        fetch("/produse_cos", {

                method: "POST",
                headers: { 'Content-Type': 'application/json' },

                mode: 'cors',
                cache: 'default',
                body: JSON.stringify({
                    ids_prod: vect_ids,

                    a: 10
                })
            })
            .then(function(rasp) {
                console.log(rasp);
                console.log("test");
                x = rasp.json();
                console.log(x);
                return x
            })
            .then(function(objson) {

                console.log(objson);
                for (let prod of objson) {
                    let divCos = document.createElement("div");

                    divCos.classList.add("cos-virtual")
                    let divImagine = document.createElement("div");
                    let imag = document.createElement("img");
                    imag.src = "/Resources/Images/Products/Femei/" + prod.imag;
                    divImagine.appendChild(imag);
                    divCos.appendChild(divImagine);
                    let divInfo = document.createElement("div");
                    divInfo.innerHTML = `<p><b>${prod.name}</b></p><p>Pret: ${prod.price}</p><p>Categorie: ${prod.category}</p><p>Marime: ${prod.size}</p><p>Culoare: ${prod.color}</p><p>Materiale: ${prod.materials}`;
                    let divDelete = document.createElement("div");
                    divDelete.innerHTML = `<button class = "delete" value= ${prod.id}>Delete Item</button>`;

                    divCos.appendChild(divInfo);
                    divCos.appendChild(divDelete);
                    document.getElementsByTagName("main")[0].insertBefore(divCos, document.getElementById("cumpara"));

                    for (let button of document.getElementsByClassName("delete"))
                        button.onclick = function() {
                            console.log("Click");

                            var vect_ids = localStorage.getItem("produse_selectate").split(",");

                            console.log("buton value e " + button.value);

                            vect_ids.splice(vect_ids.indexOf(button.value + ""), 1);

                            console.log("vect_ids este: ");

                            console.log(vect_ids);

                            localStorage.setItem("produse_selectate", vect_ids);

                            window.location.reload();


                        }
                }

            }).catch(function(err) { console.log(err) });






        document.getElementById("cumpara").onclick = function() {
            var vect_ids = localStorage.getItem("produse_selectate").split(",");
            fetch("/cumpara", {

                    method: "POST",
                    headers: { 'Content-Type': 'application/json' },

                    mode: 'cors',
                    cache: 'default',
                    body: JSON.stringify({
                        ids_prod: vect_ids,
                        a: 10
                    })
                })
                .then(function(rasp) { console.log(rasp); return rasp.text() })
                .then(function(raspunsText) {

                    console.log(raspunsText);

                    let p = document.createElement("p");
                    p.innerHTML = raspunsText;
                    document.getElementsByTagName("main")[0].innerHTML = "";
                    document.getElementsByTagName("main")[0].appendChild(p)
                    if (!raspunsText.includes("nu sunteti logat"))
                        localStorage.removeItem("produse_selectate");

                }).catch(function(err) { console.log(err) });
        }
    } else {
        document.getElementsByTagName("main")[0].innerHTML = " <div class=\"maindivreg\"><div class=\"content\"><p>Nu aveti nimic in cos!</p></div></div>";
    }


});