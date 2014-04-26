class RequestsController < ApplicationController
  expose(:request_object, model: :request, attributes: :request_params)
  expose(:requests) { |collection| collection.page(params[:page]).per(10) }
  before_action :authenticate_user!
  before_action :set_request, only: [:show, :edit, :update, :destroy]


  def create
    if request_object.save
      redirect_to request_object, notice: 'Request was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if request_object.update(request_params)
      redirect_to request_object, notice: 'Request was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    request_object.destroy
    redirect_to requests_url, notice: 'Request was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      request = Request.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.require(:request).permit(:name, :description)
    end
end
