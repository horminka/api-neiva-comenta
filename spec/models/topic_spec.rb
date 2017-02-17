require 'rails_helper'

RSpec.describe Topic, type: :model do
  before :each do
    @topic = Fabricate.build :topic
  end

  context "Atributos válidos" do
    it "es válido con todos sus atributos" do
      expect(@topic).to be_valid
    end
  end

  context "Atributos requeridos" do
    it "no es válido sin título" do
      @topic.title = nil
      expect(@topic).not_to be_valid
      expect(@topic.errors[:title]).to include("can't be blank")
    end

    it "no es válido sin contenido" do
      @topic.content = nil
      expect(@topic).not_to be_valid
      expect(@topic.errors[:content]).to include("can't be blank")
    end

    it "no es válido sin imagen" do
      @topic.image = nil
      expect(@topic).not_to be_valid
      expect(@topic.errors[:image]).to include("can't be blank")
    end

    it "no es válido sin board" do
      @topic.board = nil
      expect(@topic).not_to be_valid
      expect(@topic.errors[:board]).to include("can't be blank")
    end
  end

  context "Atributos no válidos" do
    it "no es válido si el título tiene más de 100 caracteres" do
      @topic.title = "a" * 101
      expect(@topic).not_to be_valid
      expect(@topic.errors[:title]).to include("is too long (maximum is 100 characters)")
    end

    it "no es válido si el contenido tiene más de 1200 caracteres" do
      @topic.content = "a" * 1201
      expect(@topic).not_to be_valid
      expect(@topic.errors[:content]).to include("is too long (maximum is 1200 characters)")
    end

    it "no es válido si imagen tiene más de 200 caracteres" do
      @topic.image = "a" * 201
      expect(@topic).not_to be_valid
      expect(@topic.errors[:image]).to include("is too long (maximum is 200 characters)")
    end
  end

end
