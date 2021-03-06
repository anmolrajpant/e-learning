class CoursesController < ApplicationController

  def index
    @courses = Course.where(:user_id=>current_user)
  end

  def show
    @courses = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    #binding.pry
    @course = current_user.courses.new(course_params)
    if @course.save
      redirect_to courses_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      redirect_to courses_path
    end
  end

  def course_params
    params.require(:course).permit(:title)
  end
end
