class Api::V1::SubjectsController < ApplicationController

  #before_action :set_subject, only: %i[] #show update delete

  def index
    @subjects = Subject.all
    render json: @subjects
  end

private

def set_subject
  @subject = Subject.find(params[:id])
end

def subject_params
  params.require(:subject).permit(:name, :detail)
end

end
