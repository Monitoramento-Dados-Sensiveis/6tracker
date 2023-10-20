var express = require("express");
var router = express.Router();

router.get("/buscar/:idServidor", function (req, res) {
    localController.buscarServidor(req, res);
})

module.exports = router;