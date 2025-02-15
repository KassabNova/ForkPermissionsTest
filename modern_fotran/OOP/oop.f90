! we have changed the dummy parameters from type(Circle) to class(Circle). 
! We can then call the class functions in an object-oriented fashion as
! a = c%area and call c%print
module class_Circle
    implicit none
    private
    real :: pi = 3.1415926535897931 ! Class-wide private constant
  
    type, public :: Circle
        real :: radius
    contains
        procedure :: area => circle_area
        procedure :: print => circle_print
    end type Circle

contains
    function circle_area(this) result(area)
      class(Circle), intent(in) :: this
      ! intent(out) is inappropriate for the result
      ! Intent can be specified for the function arguments only
      ! real, intent(out) :: area
      real :: area
      area = pi * this%radius**2
    end function circle_area
  
    subroutine circle_print(this)
      class(Circle), intent(in) :: this
      real :: area
      area = this%area()  ! Call the type-bound function
      print *, 'Circle: r = ', this%radius, ' area = ', area
    end subroutine circle_print
  end module class_Circle
  
  
  program circle_test
    use class_Circle
    implicit none
    
    type(Circle) :: c     ! Declare a variable of type Circle.
    !c = Circle(1.5)       ! Use the implicit constructor, radius = 1.5.
    c%radius = 1.5
    call c%print          ! Call the type-bound subroutine
  end program circle_test