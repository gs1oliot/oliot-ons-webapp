#!/usr/bin/awk -f
BEGIN { answer = 0 }
/^;; ANSWER SECTION:/ {
	#print $0 $1 $2 $3 $4 $5
	answer = 1
	next
}
/^3.5.1.0.0.0.0.0.0.0.0.8.8.gtin.gs1.id.onsepc.kr./ {
	response = $9
}
/^;; Query time:/ {
	if( answer == 1)
		printf("%s\t%s\n", response, $4);
	else
		printf("\n");
}
