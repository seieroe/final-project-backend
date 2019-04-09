class Api::V1::CodersController < ApplicationController

  before_action :find_coder, only: [:update]
  def index
    @coders = Coder.all.sort_by{|coder| coder.id}
    render json: @coders, include: :projects
  end

  def create
    @coder = Coder.create(coder_params)
    # If you want to get just the path without the base_url,
    # another way to do this is like this; you can also specify
    # other flags like saying this should be an attachment, etc...
    # rails_blob_path(@coder.image, disposition: 'attachment')
    # @coder.image.attach(coder_params[:image])
    render json: @coder
  end

  def update
    @coder = Coder.find(params[:id])
    @coder.update(coder_params)
    if @coder.save
      render json: @coder, status: :accepted
    else
      render json: { errors: @coder.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def show
      @coder = Coder.find(params[:id])
      render json: @coder, include: :projects
  end

  private

  def coder_params
    params.permit(:name)
  end

  def find_coder
    @coder = Coder.find(params[:id])
  end

end
