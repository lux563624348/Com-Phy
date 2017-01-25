ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      Subroutine makestatistics(mydata, statistics_results, sigma, ncolumns, nrows)
c     Xiang 8.Oct 2016: 
c     Read the data from main program, and calculate every components of linear regression.
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c     "Mean of X is:",statistics_results(1)
c     "Mean of Y is:",statistics_results(2)
c     "Variance of {Xi} is:",statistics_results(3)
c     "Cross Correlations of {Xi} and {Yi} is:",statistics_results(4)
c     "Estimate for the uniform error:",statistics_results(5)
c     "The intercept of linear regression ± its error",statistics_results(6),"±",sigma(2)
c     "The slope of linear regression ± its error ",statistics_results(7),"±",sigma(3)
c     "Correlation Coefficient:",statistics_results(8)
c      
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c     DECLARATIONS
      Implicit None
      Real*8, Intent(in) :: mydata(nrows,ncolumns) ! the data
      Real*8, Intent(out):: statistics_results(8),sigma(3)  ! for output
      Real*8 :: sum_data(5), ave_data(2)
      Real*8 :: intercept_a, slope_b, Cor_co
      ! 1for x, 2 for y.
      Integer, Intent(in) :: nrows,ncolumns
      Integer :: i
      
      sum_data = 0
      statistics_results = 0 ! Initialize 
      sigma = 0
      
c   Calculate the mean of x and y  (1 for x, 2 for y)
      Do i = 1, nrows
        sum_data(1) = sum_data(1) + mydata(i,1)
        sum_data(2) = sum_data(2) + mydata(i,2)
      Enddo ! i
      
      ave_data(1) = sum_data(1)/nrows
      ave_data(2) = sum_data(2)/nrows
      
c   Calculate the sum of variance of {xi} sum_data (3) and &
cross correlations of {xi} and {yi} and slope B sum_data(4)
      Do i = 1, nrows
        sum_data(3) = sum_data(3) + ( mydata(i,1)-ave_data(1) )**2
        sum_data(4) = sum_data(4) + ( mydata(i,1)-ave_data(1) )*(mydata(i,2)-ave_data(2))
      Enddo ! i
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc      
      ! Slope and intercept
      slope_b = sum_data(4)/sum_data(3)
      intercept_a = ave_data(2) - slope_b*ave_data(1)
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc     
      ! Estimate Uniform Error sigma(1)
      Do i = 1, nrows
        sum_data(5) = sum_data(5) + (mydata(i,2)-intercept_a - slope_b*mydata(i,1))**2 
      Enddo
      sigma(1) = (nrows -2)**(-0.5)*sum_data(5)**(0.5)
      ! error on intercept 
      sigma(2) = sigma(1) / (nrows)**(0.5) * (1+ nrows*ave_data(1)**2/sum_data(3))**(0.5)
      ! error on slope 
      sigma(3) = sigma(1) / sum_data(3)**(0.5)
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      ! Correlation coefficient
      Cor_co = - sigma(1)**2*ave_data(1)/sigma(2)/sigma(3)/sum_data(3)
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc      
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc      
c     output the results 
      statistics_results(1) =  ave_data(1)
      statistics_results(2) =  ave_data(2)
      statistics_results(3) =  sum_data(3)
      statistics_results(4) =  sum_data(4)
      statistics_results(5) =  sigma(1)
      statistics_results(6) =  intercept_a
      statistics_results(7) =  slope_B
      statistics_results(8) =  Cor_co
      
      Return
      End! 
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
