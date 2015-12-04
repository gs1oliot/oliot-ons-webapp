var dns = require('native-dns');
var util = require('util');
var argv =  require('optimist')
		.usage('Usage: $0 -n [num] -t [num] -a [string]')
		.default({n:1000, t:1000, a:'143.248.1.177'})
		.argv;


var start = Date.now();
var totalNoResponse=0;

var num = argv.n; 
var time = argv.t;
var address = argv.a;

for(var i = 0; i< num; ++i){
var question = dns.Question({
  name: '3.5.1.0.0.0.0.0.0.0.0.8.8.gtin.gs1.id.onsepc.kr',
  type: 'NAPTR',
});
var req = dns.Request({
  question: question,
  server: { address: address, port: 53, type: 'udp' },
  timeout: time,
});

req.on('timeout', function () {
	totalNoResponse++;
	console.log(totalNoResponse);
  //console.log('Timeout in making request');
});

req.on('message', function (err, answer) {
  answer.answer.forEach(function (a) {
	  //totalResponse++;
	  //console.log(totalResponse);
    //console.log(a);
  });
});

req.on('end', function () {	
	//var delta = (Date.now()) - start;
	//console.log('Finished processing request: ' + delta.toString() + 'ms' + 'i:' + i);
});
req.send();
}

var delta = (Date.now()) - start;
console.log('Finished processing request: ' + delta.toString() + 'ms');


