require "rails_helper"

RSpec.describe Subject, type: :model do

  before{@subject = Subject.new}

  describe "Teste de preenchimento do model Subject" do

    it "name consegue ser preenchido?" do
      @subject.name = "Matemática"
      expect(@subject.name).to eq("Matemática")
    end

    it "detail consegue ser preenchido?" do
      @subject.detail = "funções do primeiro grau"
      expect(@subject.detail).to eq("funções do primeiro grau")
    end

  end

  describe "Teste de validação do model Subject" do

    it "Subject valido com campos obrigatorios preenchidos?" do
      @subject.name = "Fisica"
      @subject.detail = "Ondulatoria"
      expect(@subject).to be_valid
    end

    it "Subject invalido com campos obrigatorios não preenchidos?" do
      subject = Subject.new
      expect(subject).to be_valid
    end

  end

end
