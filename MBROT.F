C ============================================================================
C Name        : MBROT.f
C Author      : Sutinder S. Saini
C Version     : 1.0
C Copyright   : (C) Sutinder S. Saini, All rights reserved.
C Description : Displays the mandelbrot set in ASCII.
C ============================================================================
      PROGRAM MBROT
C     M: Max iterations
C     W: Picture width
C     H: Picture height
C     X: Current x coordinate in picture
C     Y: Current y coordinate in picture
C     TMP: Temporary storage
C     I: Iteration counter storage
C     TFN: Target write (file) location
            INTEGER MAXITR, W, H
            INTEGER X,Y
            DOUBLE PRECISION ZR, ZI
            DOUBLE PRECISION PR, PI, TMP
            CHARACTER*6 TFN

C          LOOP STATE STORAGE:
            INTEGER I

C           USER INPUT

            WRITE (*,*) '!!WARNING!! THIS PROGRAM CREATES LARGE FILES!'
            WRITE (*,*) 'ENTER IMAGE WIDTH: '
            READ (*,*) W

            WRITE (*,*) 'ENTER IMAGE HEIGHT: '
            READ (*,*) H

            WRITE (*,*) 'ENTER MAX ITERATIONS'
            READ (*,*) MAXITR

            WRITE (*,*) 'ENTER OUTPUT FILE NAME: '
            READ (*,*) TFN
            
C           MARK FILE FOR READING - DEVICE ID: 41
            OPEN(UNIT=41,FILE=TFN )

            IF ( MAXITR .LT. 0 ) THEN
                  WRITE (*,*) 'NO MAX ITR DEFINED. DEFAULTING TO: 1000'
                  MAXITR = 1000
            ENDIF
            

            DO 10 Y = 0 , H
                  DO 20 X = 0 , W
                        PR = ( X - W / 2.0 ) * 4.0 / W
                        PI = ( Y - H / 2.0 ) * 4.0 / W
                        ZR = 0
                        ZI = 0
                        I = 0

                        DO 30 WHILE ( ZR * ZR + ZI * ZI .LE. 4.0 )

                              IF ( I .LT. MAXITR ) THEN
                                    TMP = ZR * ZR - ZI * ZI + PR
                                    ZI = 2.0 * ZR * ZI + PI
                                    
                                    ZR = TMP
                                    I = I + 1
                              ELSE
                                    GOTO 40
                              END IF
30    CONTINUE
40    IF ( I .EQ. MAXITR ) THEN
            WRITE (41, '(A)', ADVANCE='NO') '*'
      ELSE
            WRITE (41, '(A)', ADVANCE='NO') ' '
      END IF

20    CONTINUE
      WRITE (41,*) ' '
10    CONTINUE
      END
C     *******************
