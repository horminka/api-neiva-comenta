class TopicsController < ApplicationController
  before_action :set_topic, only: [:show]

  # GET /topics/1
  # GET /topics/1.json
  def show
    render json: @topic, serializer: TopicPostSerializer, root: 'topic'
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      render json: @topic, status: :created
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  private

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.permit(:title,
                   :content,
                   :image,
                   :board_id)
    end
end
