require 'rails_helper'

RSpec.describe "Boards", type: :request do

  before :each do
    @cabeceras_peticion = {
      "Accept": "application/json",
      "Content-Type": "application/json"
    }
    @board_uno = Fabricate :board
    @board_dos = Fabricate :board
    @board_with_topics = Fabricate :board_with_five_topics
  end

  describe "Index: GET /boards" do
    it "devuelve todas las boards" do
      get "/boards", {}, @cabeceras_peticion

      expect(response).to have_http_status(:ok)

      body = JSON.parse(response.body)
      boards = body['boards']
      names_board = boards.map{ |m| m["name"] }
      descriptions_board = boards.map{ |m| m["description"] }

      expect(names_board).to match_array([@board_uno.name, @board_dos.name, @board_with_topics.name])
      expect(descriptions_board).to match_array([@board_uno.description, @board_dos.description, @board_with_topics.description])
    end
  end

  describe "Ver: GET /boards/:id" do
    it "devuelve la board con el id :id y sus topics" do
      get "/boards/#{@board_with_topics.id}", {}, @cabeceras_peticion

      expect(response).to have_http_status(:ok)

      body = JSON.parse(response.body)
      board = body['board']
      expect(board["name"]).to eq @board_with_topics.name
      expect(board["description"]).to eq @board_with_topics.description
      expect(board["topics"]).to match_array(@board_with_topics.topics.map { |t| { "id" => t.id,
                                                                                   "title" => t.title,
                                                                                   "content" => t.content,
                                                                                   "image" => t.image,
                                                                                   "last_posts" => t.last_posts,
                                                                                   "created_at" => t.created_at.to_formatted_s(:iso8601) } })
    end
  end
end
