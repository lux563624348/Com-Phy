ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc  
      Subroutine findNrows(filename,nrows)
c     hgrie Sep 2016: determine number nrows of lines of a file named filename. 
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c     DECLARATIONS
      
      IMPLICIT none
      Character*200 :: dummy 
      Character*30, intent(in) :: filename
      Integer, intent(out) :: nrows ! number of lines in file = number of rows
      Integer :: ios ! variable for error throw
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
      Open(unit=13, file=filename, status='OLD')
      nrows=0
c     do loop terminates when reading from file is not successful 
      Do ! eternal loop
         Read (13, *, iostat=ios) dummy
         If (ios/=0) exit 
         nrows=nrows+1
      End do ! eternal loop
      Close(13)
      Write(*,*) "File ",filename," has nrows = ",nrows,"lines."

      Return
      End ! findNrows
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
