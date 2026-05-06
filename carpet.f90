program carpet
    implicit none
    
    interface
        subroutine show_img_color(w, h, A) bind(js)
            integer, intent(in) :: w, h
            integer, intent(in) :: A(4,w,h)
        end subroutine
    end interface

    integer, parameter :: n = 729
    integer :: image(4, n, n)
    integer :: i, j, x, y, is_hole

    do j = 1, n
        do i = 1, n
            x = i - 1
            y = j - 1
            is_hole = 0
            
            do while (x > 0 .or. y > 0)
                if (mod(x, 3) == 1 .and. mod(y, 3) == 1) then
                    is_hole = 1
                    exit
                end if
                x = x / 3
                y = y / 3
            end do
            
            if (is_hole == 1) then
                image(1, i, j) = 255
                image(2, i, j) = 255
                image(3, i, j) = 255
                image(4, i, j) = 255
            else
                image(1, i, j) = 0
                image(2, i, j) = 87
                image(3, i, j) = 231
                image(4, i, j) = 255
            end if
        end do
    end do

    call show_img_color(n, n, image)

end program carpet
