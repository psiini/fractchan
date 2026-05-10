C ============================================================================
C Name        : SIERPASCII.f
C Author      : Sutinder S. Saini
C Version     : 1.0
C Copyright   : (C) Sutinder S. Saini, All rights reserved.
C Description : Write the sierpinski triangle to a file. (Max 5 char!)
C ============================================================================
      PROGRAM SIERPASCII
      INTEGER X, Y, N, D
      CHARACTER*5 NM
C     ** USER INPUT **
      WRITE (*,*) 'ENTER DEPTH:'
      READ (*,*) D
      WRITE (*,*) 'ENTER FILE:'
      READ (*,*) NM
      
C      ** PROGRAM CODE **
      OPEN(100, FILE=NM)
      DO 10 Y=0,D
      DO 20 X=0,Y
            IF (IAND(X, Y-X) .EQ. 0) THEN
                  WRITE (100,'(A)', ADVANCE='NO') '@'
            ELSE
                  WRITE (100,'(A)', ADVANCE='NO') ' '
            END IF
20    CONTINUE
      WRITE(100, *) ' '
10    CONTINUE
      END
C     *******************
