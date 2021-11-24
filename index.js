const express = require('express');

app = express();

app.set("view engine", "ejs");

app.use("/Resources", express.static(__dirname + "/Resources"))

app.get(["/", "/index", "/home"], function(req, res) {
    console.log(req.url);
    res.render("pagini/index.ejs", { ip: req.ip });

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