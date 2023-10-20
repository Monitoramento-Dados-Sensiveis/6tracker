var express = require("express");
var router = express.Router();

var componenteController = require("../controllers/componenteController");


router.get("/buscar/", function (req, res) {
    componenteController.buscarServidores(req, res);
})

module.exports = router;