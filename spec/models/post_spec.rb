require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @post = Fabricate.build :post
  end

  context "Atributos válidos" do
    it "es válido con todos sus atributos" do
      expect(@post).to be_valid
    end
  end

  context "Atributos requeridos" do
    it "no es válido sin contenido" do
      @post.content = nil
      expect(@post).not_to be_valid
      expect(@post.errors[:content]).to include("can't be blank")
    end

    #it "no es válido sin imagen" do
      #@post.image = nil
      #expect(@post).not_to be_valid
      #expect(@post.errors[:image]).to include("can't be blank")
    #end

    it "no es válido sin topic" do
      @post.topic = nil
      expect(@post).not_to be_valid
      expect(@post.errors[:topic]).to include("can't be blank")
    end
  end

  context "Atributos no válidos" do
    it "no es válido si el contenido tiene más de 1200 caracteres" do
      @post.content = "a" * 1201
      expect(@post).not_to be_valid
      expect(@post.errors[:content]).to include("is too long (maximum is 1200 characters)")
    end

    it "no es válido si imagen tiene más de 200 caracteres" do
      @post.image = "a" * 201
      expect(@post).not_to be_valid
      expect(@post.errors[:image]).to include("is too long (maximum is 200 characters)")
    end
  end
end
