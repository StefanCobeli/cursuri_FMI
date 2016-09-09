centralLimit <- function(my_nb, my_mean, my_sd,nb_sample, my_step){

		
	subjects = rnorm(my_nb,my_mean, my_sd)
	print('Media adevarata este:')
	print(mean(subjects))
	print('Iar media esantioanelor, crescatoare la numar:')
	my_sample = NULL
	my_sequence = NULL
	
	for( i in 1+1:my_step-1){
	
		my_sample = sample(subjects,nb_sample/(my_step-i+1))
		print('Pentru' )
		print( round(nb_sample/(my_step-i+1)))
		print('subiecti, avem media')
		
		my_sequence[i] =  mean(my_sample)
		print(my_sequence[i])
		print('############')
	}
	#print (my_sequence)
	
	
	
	
	
}