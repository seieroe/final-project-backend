class Api::V1::ClientsController < ApplicationController

  before_action :find_client, only: [:update]
  before_action :set_storage_url, only: [:create, :show]

  def index
    @clients = Client.all
    render json: @clients, include: :projects
  end

  def create
    @client = Client.create(client_params)
    # If you want to get just the path without the base_url,
    # another way to do this is like this; you can also specify
    # other flags like saying this should be an attachment, etc...
    # rails_blob_path(@client.image, disposition: 'attachment')
    @client.image.attach(client_params[:image])
    render json: {
      user_id: @client.user_id,
      url: url_for(@client.image)
    }
  end

  def update
    @client.update(client_params)
    if @client.save
      render json: @client, status: :accepted
    else
      render json: { errors: @client.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def show
    @client = Client.find(params[:id])
    render json: @client, include: :projects
  end

  private

  def client_params
    params.permit(:name)
  end

  def set_storage_url
    ActiveStorage::Current.host = request.base_url
  end

  def find_client
    @client = Client.find(params[:id])
  end

end
