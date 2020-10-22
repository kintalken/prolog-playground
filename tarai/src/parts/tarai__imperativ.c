
int tarai__impertiv(int X, int Y, int Z)
{
	for (;;)
	{
		if (X <= Y)
		{
			return Y ;
		}
		else
		{
			int temp1 = tarai(X - 1, Y, Z) ;
			int temp2 = tarai(Y - 1, Z, X) ;
			int temp3 = tarai(Z - 1, X, Y) ;
			X = temp1 ;
			Y = temp2 ;
			Z = temp3 ;
		}
	}
}
