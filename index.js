const { create } = require('domain');
const express = require('express');
const fs = require('fs');
const sharp = require('sharp');

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
        let dim_medie = 500;

        imag.mic = `${obImagini.cale_galerie}/mic/${nume_imag}-${dim_mic}.webp`;
        imag.medie = `${obImagini.cale_galerie}/medie/${nume_imag}-${dim_medie}.webp`

        imag.mare = `${obImagini.cale_galerie}/${nume_imag}.jpg`

        if (!fs.existsSync(imag.mic)) {
            console.log(__dirname + "/" + imag.mare);
            sharp(__dirname + "/" + imag.mare).resize(dim_mic).toFile(__dirname + "/" + imag.mic);
        }
        if (!fs.existsSync(imag.medie)) {
            console.log(__dirname + "/" + imag.mare);
            sharp(__dirname + "/" + imag.mare).resize(dim_medie).toFile(__dirname + "/" + imag.medie);
        }

    }


}


function chooseImages() {
    var date = new Date();
    var today = Date.parse('01/01/2011 ' + date.getHours() + ':' + date.getMinutes());
    console.log("Asta e azi " + today);
    var timp1, timp2;
    var imagini;
    for (let i = 0; i < obImagini.imagini.length; i++) {

        [timp1, timp2] = obImagini.imagini[i].timp.split("-");
        console.log(today + " " + Date.parse('01/01/2011 ' + timp1));
        if (today >= Date.parse('01/01/2011 ' + timp1) && today <= Date.parse('01/01/2011 ' + timp2)) {
            // console.log("Am intrat aicea");
        } else {
            console.log("AM ELIMINAT UNUL");
            obImagini.imagini.splice(i, 1);
            i--;
        }
        // console.log("Aici am obimagini de i: " + obImagini.imagini[i]);



    }
}
createImages();
chooseImages();
app.get(["/", "/index", "/home"], function(req, res) {
    console.log(req.url);
    //------galerie


    res.render("pagini/index.ejs", { ip: req.ip, imagini: obImagini.imagini, cale: obImagini.cale_galerie + "/" });

});

app.get("/gallery", function(req, res) {
    console.log(req.url);
    //------galerie


    res.render("pagini/gallery.ejs", { imagini: obImagini.imagini, cale: obImagini.cale_galerie + "/" });

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