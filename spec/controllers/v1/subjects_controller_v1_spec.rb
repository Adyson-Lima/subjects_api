require "rails_helper"

RSpec.describe Api::V1::SubjectsController, type: :controller do

  before{@subject = Subject.create(name: "Geografia", detail: "Espaço geografico")}

  describe "GET /api/v1/subjects" do
    it "Consegue listar todos os subjects e retornar status 200?" do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/subjects/id" do
    it "Consegue retornar um subject especifico e status 200?" do
      get :show, params: {id: @subject.id}
      expect(response.body).to include_json(id: @subject.id)
      expect(response).to have_http_status(200)
    end
  end

end
