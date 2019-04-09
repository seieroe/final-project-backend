class Api::V1::ProjectsController < ApplicationController

  before_action :find_project, only: [:update]
  def index
    @projects = Project.all.sort_by{|project| project.id}
    render json: @projects, include: [:coders, :client]
  end

  def create
    @project = Project.create(project_params)
    render json: @project
  end

#//how to structure the json response when it comes back that
#//includes the assosciated join talble (coders) =>
# i can do this in the controller action or with a serializer

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    if @project.save
      render json: @project, status: :accepted
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def show
      @project = Project.find(params[:id])
      render json: @project, include: [:coders, :client]
  end

  private

  def project_params
    params.permit(:name)
  end

  def find_project
    @project = Project.find(params[:id])
  end

end
