class TopicsController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @topics= @course.topics
  end

  def show
    @course = Course.find(params[:course_id])
    @topic = @course.topics.find(params[:id])
  end

  def new
    @course = Course.find(params[:course_id])
    #binding.pry
    @topic = @course.topics.new
  end

  def create
    @course = current_user.courses.find(params[:course_id])
    @topic = @course.topics.new(save)
    if @course.save
      redirect_to courses_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @course = Course.find(params[:course_id])
    @topic = @course.topics.find(params[:id])
    if @topic.destroy
      redirect_to(:action => :index)
    end
  end
private
  def save
    params.require(:topic).permit(:subject, :desc)
  end
end
