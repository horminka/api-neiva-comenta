require 'rails_helper'

RSpec.describe "Topics", type: :request do
  before :each do
    @cabeceras_peticion = {
      "Accept": "application/json",
      "Content-Type": "application/json"
    }
  end

  describe "Crear: POST /topics" do
    before :each do
      @board = Fabricate :board
      @new_topic = Fabricate.build :topic, board: @board
      @topic_params = @new_topic.attributes.to_json
    end

    it "crea el topic" do
      post "/topics", @topic_params, @cabeceras_peticion

      expect(response).to have_http_status(:created)
      expect(Topic.last.title).to eq @new_topic.title
      expect(Topic.last.content).to eq @new_topic.content
      expect(Topic.last.image).to eq @new_topic.image
      expect(Topic.last.board).to eq @new_topic.board
    end
  end

  describe "Ver: GET /topics/:id" do
    it "devuelve el topic con el id :id con sus posts y aparte los 3 últimos" do
      @topic_with_posts = Fabricate :topic_with_posts
      get "/topics/#{@topic_with_posts.id}", {}, @cabeceras_peticion

      expect(response).to have_http_status(:ok)

      body = JSON.parse(response.body)
      topic = body['topic']

      expect(topic["title"]).to eq @topic_with_posts.title
      expect(topic["content"]).to eq @topic_with_posts.content
      expect(topic["image"]).to eq @topic_with_posts.image
      expect(topic["created_at"]).to eq @topic_with_posts.created_at.to_formatted_s(:iso8601)
      expect(topic["posts"]).to match_array(@topic_with_posts.posts.map { |t| { "id" => t.id,
                                                                                "content" => t.content,
                                                                                "image" => t.image,
                                                                                "created_at" => t.created_at.to_formatted_s(:iso8601) } })
    end
  end
end
