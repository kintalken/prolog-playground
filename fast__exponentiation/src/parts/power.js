
function power(a,b)
{
	let x = a ;
	let y = 1 ;
	let z = b ;

	while (true)
	{
		if (z == 0)
			return y ;

		r = remainder(z,2) ;
		
		z = quotient(z,2) ;

		if (r == 1)
			y = x * y ;
		
		x = x * x ;
	}
}

function remainder(a,b)
{
	return a % b ;
}

function quotient(a,b)
{
	return Math.floor(a / b) ;
}

