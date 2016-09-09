confidenceInterval <- function(my_confidence){

	my_table = read.table("D:\\Toate\\Facultate all\\3.Anul al III-lea\\Statistica\\My_Work\\sunspots.txt",
						header = T )
	print (my_table[1,2])	
	
	my_length = length(my_table[,12])
	
	my_variable = qt(1-(my_confidence/2),my_length)
	my_mean = mean(my_table[,12])
	sum = 0
	
	for(i in 1:my_length){
		
		sum = sum + (my_table[i,12]-my_mean)^2
		
	}
	
	sum = sqrt( sum / ( my_length-1 ) )
	
	lower_endpoint = my_mean - my_variable * (sum / sqrt( my_length ))
	upper_endpoint = my_mean + my_variable * (sum / sqrt( my_length ))
	
	
	print(paste0("  Pentru ", my_length, " inregistrari de medie ",  my_mean ))
	print(paste0("si de dispersie ", sum))
	print("intervalul de incredere este: " )
	print(paste0("[ ", lower_endpoint, ", ", upper_endpoint, " ]. "))
	
	
}