BEGIN{
	total = 0;
	num = 0;
}
{
	if( $2>=0 ) {
		total += $2
		++num
	}
}
END {
	printf("Success: %d, Fail: %d\n", num, n-num);
	printf("Total delay: %f ms\n", total);
	printf("Average delay: %f ms\n", total/num); 
}
