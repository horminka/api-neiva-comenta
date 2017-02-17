class PostsController < ApplicationController

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

    def post_params
      params.permit(:content,
                   :image,
                   :topic_id)
    end
end
