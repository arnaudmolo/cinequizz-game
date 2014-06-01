var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res) {
  console.log('la route ?')
  res.render('index', { title: 'Express' });
});

module.exports = router;
