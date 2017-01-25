ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      Subroutine writeresults( statistics_results, sigma)
c     Xiang 8.Oct 2016: 
      
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c     DECLARATIONS
      Implicit None
      Real*8, Intent(out) :: statistics_results (8), sigma(3)   
      ! for output

c     Write the results 
      Write(*,*),"Mean of X is:",statistics_results(1)
      Write(*,*),"Mean of Y is:",statistics_results(2)
      Write(*,*),"Variance of {Xi} is:",statistics_results(3)
      Write(*,*),"Cross Correlations of {Xi} and {Yi} is:",statistics_results(4)
      Write(*,*),"Estimate for the uniform error:",statistics_results(5)
      Write(*,*),"The intercept of linear regression:",statistics_results(6),"±",sigma(2)
      Write(*,*),"The slope of linear regression:",statistics_results(7),"±",sigma(3)
      Write(*,*),"Correlation Coefficient:",statistics_results(8)
      
      
      
      Return
      End ! 
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
