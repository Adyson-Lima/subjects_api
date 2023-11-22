require "rails_helper"

RSpec.describe Subject, type: :model do

  before{@subject = Subject.new}

  describe "Teste de preenchimento do model Subject" do

    it "name consegue ser preenchido?" do
      @subject.name = "Matemática"
      expect(@subject.name).to eq("Matemática")
    end

  end

end
