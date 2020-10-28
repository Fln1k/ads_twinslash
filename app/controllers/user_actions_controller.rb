class UserActionsController < ApplicationController
  def to_draft
    @ad = Ad.find(params[:id])
    authorize! :update_state, @ad
    @ad.to_draft

    respond_to do |format|
      format.html { redirect_to ads_myads_path }
      format.json { head :no_content }
    end
  end

  def to_new
    @ad = Ad.find(params[:id])
    authorize! :update_state, @ad
    @ad.to_new

    respond_to do |format|
      format.html { redirect_to ads_myads_path }
      format.json { head :no_content }
    end
  end
end
