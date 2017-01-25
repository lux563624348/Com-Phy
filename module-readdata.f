
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      Subroutine readdata(filename,mydata,ncolumns,nrows)
c     Xiang 8.Oct 2016: 
c     read ncolumns columns from file with nrows lines, making an array
c     called mydata out of it. 
      
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c     DECLARATIONS
      
      IMPLICIT none
      Real*8, intent(out) :: mydata(nrows,ncolumns) ! the data
      Character*30, intent(in) :: filename
      Integer, intent(in) :: nrows,ncolumns ! number of rows and columns of data
      Integer :: i ! do-loop index
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      Open(unit=13, file=filename, status='OLD')
      Do i=1,nrows ! read each line into row of mydata
         Read (13, *) mydata(i,:)
      End do ! read each line
      Close(13)
c     tell user what you found
      Write(*,*) "Read ",nrows," elements from file ",filename,"."
      Write(*,*) "  First element: ",mydata(1,:)
      Write(*,*) "  Last element : ",mydata(nrows,:)

      Return
      End ! readdata
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
