ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc  
c Xiang 8. Oct 2016 Linear Regression

ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
CCCC  Pseudocode for Linear Regression
CCCCCC Xiang Li
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

CCCC Goal: Read data and do the linear regression.

CCCC Functions:
c   readdata(filename,save_data,ncolumns,nrows)
c   findNrows(filename, nrows)
c   makestatistic(save_data, statistics_results, sigma, ncolumns, nrows)
c   writeresults(statistics_results, sigma)

CCCC Variables:
c   filename, of a data sheet
c   nrows, number of rows of the data sheet we used
c   ncolumns, number of columns of the data sheet. In here, it is 2.
c   mydata,   read data sheet and save them to an allocatable array.
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

CCCC Procedure 
c   In this problem, basically, is to read data and use this data to calculate
c   its statistical components for the linear regression calculation.
c   More detail of statistical calculation will be shown in the 
c   makestatistics subroutine. 

CCCC    NOTE: I changed the position of columns and rows of readdata.f and any other places.
CCCC    Because following a matrix convention of defination. 
CCCC    Such as: A(rows, columns)

CCCC    MAIN PROGRAM
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      Program linear_regression
      Implicit None
      Character*30 :: filename
      ! Read the data from filename 
      ! And save them into a save_data for subroutines to use.
      Real*8, Dimension(:,:),Allocatable,Save:: save_data
      ! Define a statistic_results for display all the results.
      ! Here sigma(3) is the three error are related to the statistics_ results.
      Real*8 statistics_results(8),sigma(3)
      
      Integer nrows, ncolumns
      
      filename = 'data.dat'
      ncolumns = 2
      statistics_results = 0
      
      
      
      Call findNrows(filename, nrows)
      Allocate(save_data(nrows,ncolumns))
      Call readdata(filename,save_data,ncolumns,nrows)
      Call makestatistics(save_data, statistics_results, sigma, ncolumns, nrows)
      Call writeresults(statistics_results, sigma)
      
      
      Deallocate (save_data)
      End Program linear_regression

      
