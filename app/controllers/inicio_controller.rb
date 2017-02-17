class InicioController < ApplicationController
  def index
    @inicio = "NeivaComenta\n#{DateTime.now.to_s(:short)}"
    render json: @inicio
  end
end
