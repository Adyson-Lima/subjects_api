class Api::V1::SubjectsController < ApplicationController

  before_action :set_subject, only: %i[show update] #show update delete

  def index
    @subjects = Subject.all
    render json: @subjects
  end

  def show
    render json: @subject
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      render json: @subject, status: :created, location: api_v1_subject_url(@subject)
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  def update
    if @subject.update(subject_params)
      render json: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

private

def set_subject
  @subject = Subject.find(params[:id])
end

def subject_params
  params.require(:subject).permit(:name, :detail)
end

end
