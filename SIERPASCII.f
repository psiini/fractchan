C23456789 ...
       PROGRAM SIERPASCII
       INTEGER X, Y, N, D
       
C     ** USER INPUT **
      WRITE (*,*) 'ENTER DEPTH:'
      READ (*,*) D
C           ***
       
C      ** PROGRAM CODE **
       DO 10 Y=0,D
        DO 20 X=0,Y
            IF (IAND(X, Y-X) .EQ. 0) THEN
                WRITE (*,'(A)', ADVANCE='NO') '@'
            ELSE
                WRITE (*,'(A)', ADVANCE='NO') ' '
            END IF
20    CONTINUE
      PRINT *, ' '
10    CONTINUE
        END
C     *******************
