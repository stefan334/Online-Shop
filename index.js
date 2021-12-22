const express = require('express');
const fs = require('fs');
const sharp = require('sharp');
const ejs = require('ejs');
const sass = require('sass');
const path = require('path');
const { Client } = require('pg');


var app = express();
const port = process.env.PORT || 8080;
app.set("view engine", "ejs");



// var client = new Client({ user: "ivan334", password: 'stefan334', host: 'localhost', port: 5432, database: 'magazin_haine' });
var client = new Client({
    user: "wupkgabvvfnbjv",
    password: '7ae44c0d17f5050db2e3dc2b8c54ba3b9eecf4ff78c140e91b2b999039f39aa5',
    host: 'ec2-54-89-105-122.compute-1.amazonaws.com',
    port: 5432,
    database: 'd9bvsv9ta5db70',
    ssl: {
        rejectUnauthorized: false
    }
});

client.connect();




app.get("/femei", function(req, res) {
    //------galerie
    var conditie = `where 1=1 `;
    console.log(req.query.tip);
    if (req.query.tip) {
        conditie += `and category='{${req.query.tip}}'`;
    }

    client.query(`SELECT * FROM PRODUSE ` + conditie, function(err, rez) {
        console.log(rez.rows);
        res.render("pagini/femei.ejs", { produse: rez.rows });
        console.log("Am trimis");
    });




});

app.get("/femei/:id", function(req, res) {
    console.log(req.params);

    client.query(`SELECT * FROM PRODUSE where id=${req.params.id}`, function(err, rez) {
        console.log("inauntru select");
        res.render("pagini/produs", { prod: rez.rows[0] });

    });


});



app.get("*/galerie_animata.css", function(req, res) {
    console.log("MI A INTRAT IN galerieanimata");
    res.setHeader("Content-Type", "text/css");
    let sirScss = fs.readFileSync("./Resources/Css/galerie_animata.scss").toString("utf-8");
    numarImagini = [4, 9, 16];
    let numarRandom = numarImagini[Math.floor(Math.random() * numarImagini.length)];

    console.log(numarRandom);
    let rezScss = ejs.render(sirScss, { numarRandom: numarRandom });
    fs.writeFileSync("./temp/galerie_animata.scss", rezScss);

    let cale_css = path.join(__dirname, "temp", "galerie_animata.css");
    let cale_scss = path.join(__dirname, "temp", "galerie_animata.scss");

    sass.render({ file: cale_scss, sourceMap: true }, function(err, rezCompilare) {
        console.log(rezCompilare);
        if (err) {
            console.log(`eroare: ${err.message}`);
            res.end();
            return;
        }
        fs.writeFileSync(cale_css, rezCompilare.css, function(err) {
            if (err) { console.log(err); }
        });
        res.sendFile(cale_css);
    });


});

app.get("*/galerie_animata.css.map", function(req, res) {
    let cale = path.join(__dirname, "temp", "galerie_animata.css.map");
    res.sendFile(cale);

});

app.use("/Resources", express.static(__dirname + "/Resources"));


function createImages() {
    var buf = fs.readFileSync(__dirname + "/Resources/Jsons/galerie.json").toString("utf-8");
    obImagini = JSON.parse(buf); //global
    console.log(obImagini);
    for (let imag of obImagini.imagini) {
        // console.log("a intrat")
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
    // console.log("Asta e azi " + today);
    var timp1, timp2;
    var imagini;
    for (let i = 0; i < obImagini.imagini.length; i++) {

        [timp1, timp2] = obImagini.imagini[i].timp.split("-");
        // console.log(today + " " + Date.parse('01/01/2011 ' + timp1));
        if (today >= Date.parse('01/01/2011 ' + timp1) && today <= Date.parse('01/01/2011 ' + timp2)) {
            // console.log("Am intrat aicea");
        } else {
            // console.log("AM ELIMINAT UNUL");
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




app.listen(port);

console.log("Serverul a pornit");