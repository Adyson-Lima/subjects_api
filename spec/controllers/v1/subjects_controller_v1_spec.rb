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

  describe "POST /api/v1/subjects" do
    it "Consegue criar um subject e retornar status 201?" do
      post :create, params: {subject: {name: "biologia", detail: "citologia"}, format: :json}
      expect(response.body).to include_json(detail: "citologia")
      expect(response).to have_http_status(201)
    end
  end

  describe "PATCH /api/v1/subjects/id" do
    it "Consegue atualizar um subject e retornar status 200?" do
      subject = Subject.last
      patch :update, params: {subject: {name: "quimica", detail: "atomistica"}, id: subject.id}
      expect(response.body).to include_json(detail: "atomistica")
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /api/v1/subjects/id" do
    it "Consegue excluir um subject e retornar status 204?" do
      subject = Subject.last
      delete :destroy, params: {id: subject.id}
      expect(Subject.all).not_to include(subject)
      expect(response).to have_http_status(204)
    end
  end

end
