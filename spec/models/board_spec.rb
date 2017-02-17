require 'rails_helper'

RSpec.describe Board, type: :model do
  before :each do
    @board = Fabricate.build :board
  end

  context "Atributos válidos" do
    it "es válido con todos sus atributos" do
      expect(@board).to be_valid
    end
  end

  context "Atributos requeridos" do
    it "no es válido sin nombre" do
      @board.name = nil
      expect(@board).not_to be_valid
      expect(@board.errors[:name]).to include("can't be blank")
    end

    it "no es válido sin descripción" do
      @board.description = nil
      expect(@board).not_to be_valid
      expect(@board.errors[:description]).to include("can't be blank")
    end
  end
end
