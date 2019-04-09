class Api::V1::AssignmentsController < ApplicationController

  before_action :find_assignment, only: [:update]
  before_action :set_storage_url, only: [:create, :show]

  def index
    @assignments = Assignment.all
    render json: @assignments
  end

  def create
    @assignment = Assignment.create(assignment_params)
    # If you want to get just the path without the base_url,
    # another way to do this is like this; you can also specify
    # other flags like saying this should be an attachment, etc...
    # rails_blob_path(@assignment.image, disposition: 'attachment')
    @assignment.image.attach(assignment_params[:image])
    render json: {
      user_id: @assignment.user_id,
      url: url_for(@assignment.image)
    }
  end

  def update
    @assignment.update(assignment_params)
    if @assignment.save
      render json: @assignment, status: :accepted
    else
      render json: { errors: @assignment.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def show
    @assignment = Assignment.find(params[:id])
    render json: {
      user_id: @assignment.user_id,
      url: @assignment.image.service_url
    }
  end

  private

  def assignment_params
    params.permit(:name)
  end

  def set_storage_url
    ActiveStorage::Current.host = request.base_url
  end

  def find_assignment
    @assignment = Assignment.find(params[:id])
  end

end
