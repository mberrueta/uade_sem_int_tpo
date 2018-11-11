class TopicsController < ApplicationController
  before_action :load_lesson, only: :create
  before_action :load, only: [:show, :update, :destroy]

  def index
    render json: Topic.all
  end

  def show
    render json: @topic
  end

  def create
    @topic = Topic.new(resource_params)
    @topic.lesson = @lesson

    if @topic.save
      render json: @topic
    else
      render json: { errors: @topic.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @topic

    if @topic.update(resource_params)
      render json: @topic
    else
      render json: { errors: @topic.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @topic.destroy
      head :no_content
    else
      render json: { errors: @topic.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.permit(:title, :description)
  end

  def load
    @topic = Topic.find_by(id: params[:id])
  end
end
