class OffersController < ApplicationController
  expose(:offer, attributes: :offer_params)
  expose(:offers)

  before_action :authenticate_user!
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def create
    if offer.save
      redirect_to offer, notice: 'Offer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /offers/1
  def update
    if @offer.update(offer_params)
      redirect_to @offer, notice: 'Offer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /offers/1
  def destroy
    offer.destroy
    redirect_to offers_url, notice: 'Offer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def offer_params
      params.require(:offer).permit(:message)
    end
end
