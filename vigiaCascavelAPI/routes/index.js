var express = require('express');
var router = express.Router();
var fs = require('fs');
var child = require('child_process').execFile;

/* POST home page. */
router.post('/camera/stream', function(req, res, next) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'POST, GET, PUT, DELETE, OPTIONS');
  res.header('Access-Control-Allow-Headers', 'Content-Type');

  id = req.body.id;
  url = req.body.url;

  if (fs.existsSync("/var/www/html/" + id + "/stream.m3u8")) {
    console.log("Stream já existe");
    res.status(200).json({ exitStatus: "0", error: "" });
    res.end();
  } else {
    child('/opt/vigiaCascavelAPI/scripts/iniciaStream.sh', [ id, url ]);
    console.log("Retornou Stram - OK");
    res.status(200).json({ exitStatus: "0", error: "" });
    res.end();
  }
});

router.get('/killall/streams', function(req, res, next) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'POST, GET, PUT, DELETE, OPTIONS');
  res.header('Access-Control-Allow-Headers', 'Content-Type');

  child('/opt/vigiaCascavelAPI/scripts/finalizaAllStreams.sh');
  res.status(200).json({ exitStatus: "0", error: "" });
  res.end();
});

router.get('/statusAPI', function(req, res, next) {
  res.status(200).json({ statusAPI: "OK" });
  res.end();
});

router.get('/favicon.ico', function(req, res) {
    res.status(204);
});

module.exports = router;
