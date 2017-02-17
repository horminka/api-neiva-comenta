class BoardsController < ApplicationController
  before_action :set_board, only: [:show]

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all

    render json: @boards
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    render json: @board, serializer: BoardTopicSerializer, root: 'board'
  end

  private

    def set_board
      @board = Board.find(params[:id])
    end
end
