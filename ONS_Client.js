var dns = require('native-dns');
var util = require('util');
var argv =  require('optimist')
		.usage('Usage: $0 -n [num] -t [num]')
		.demand(['n','t'])
		.argv;


var start = Date.now();
var totalNoResponse=0;
for(var i = 0; i< argv.n; ++i){
var question = dns.Question({
  name: '3.5.1.0.0.0.0.0.0.0.0.8.8.gtin.gs1.id.onsepc.kr',
  type: 'NAPTR',
});
var req = dns.Request({
  question: question,
  server: { address: '143.248.1.177', port: 53, type: 'udp' },
  timeout: argv.t,
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


