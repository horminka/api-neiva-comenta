require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before :each do
    @cabeceras_peticion = {
      "Accept": "application/json",
      "Content-Type": "application/json"
    }
  end

  describe "POST /posts" do
    before :each do
      @topic = Fabricate :topic
      @new_post = Fabricate.build :post, topic: @topic
      @post_params = @new_post.attributes.to_json
    end

    it "crea el post" do
      post "/posts", @post_params, @cabeceras_peticion

      expect(response).to have_http_status(:created)
      expect(Post.last.content).to eq @new_post.content
      expect(Post.last.image).to eq @new_post.image
      expect(Post.last.topic).to eq @new_post.topic
    end
  end
end
