const { create } = require('domain');
const express = require('express');
const fs = require('fs');
//const sharp = require('sharp');

app = express();

app.set("view engine", "ejs");

app.use("/Resources", express.static(__dirname + "/Resources"))

function createImages() {
    var buf = fs.readFileSync(__dirname + "/Resources/Jsons/galerie.json").toString("utf-8");
    obImagini = JSON.parse(buf); //global
    console.log(obImagini);
    for (let imag of obImagini.imagini) {
        console.log("a intrat")
        let nume_imag, extensie;
        [nume_imag, extensie] = imag.cale_imagine.split(".");
        let dim_mic = 150;

        imag.mic = `${obImagini.cale_galerie}/mic/${nume_imag}-${dim_mic}.webp`;

        imag.mare = `${obImagini.cale_galerie}/${nume_imag}.jpg`

        if (!fs.existsSync(imag.mic)) {
            console.log(__dirname + "/" + imag.mare);
            // sharp(__dirname + "/" + imag.mare).resize(dim_mic).toFile(__dirname + "/" + imag.mic);
        }

    }


}
createImages();
app.get(["/", "/index", "/home"], function(req, res) {
    console.log(req.url);
    //------galerie


    res.render("pagini/index.ejs", { ip: req.ip, imagini: obImagini.imagini, cale: obImagini.cale_galerie + "/" });

});

app.get("/*.ejs", function(req, res) {
    res.status(403).render("pagini/403");
});

app.get("/*", function(req, res) {
    console.log(req.url);
    res.render("pagini" + req.url, function(err, rezultatRender) {

        if (err) {

            if (err.message.includes("Failed to lookup")) {
                res.status(404).render("pagini/404");

            } else if (err) {
                console.log("AM INTRAT IN ELSE " + err);

            }
            console.log("AM IESIT DIN ELSE SI RES ARE VALOAREA:" + res);

        }
        res.send(rezultatRender);
    });

});


app.listen(8080);

console.log("Serverul a pornit");