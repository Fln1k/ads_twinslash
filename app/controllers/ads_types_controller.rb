class AdsTypesController < ApplicationController
  load_and_authorize_resource param_method: :ads_type_params

  def index
    @ads_types = AdsType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ads_types }
    end
  end

  def show
    @ads_type = AdsType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ads_type }
    end
  end

  def new
    @ads_type = AdsType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ads_type }
    end
  end

  def edit
    @ads_type = AdsType.find(params[:id])
  end

  def create
    @ads_type = AdsType.new(params[:ads_type])

    respond_to do |format|
      if @ads_type.save
        format.html { redirect_to  @ads_type, :notice => 'Ads type was successfully created.' }
        format.json { render :json => @ads_type, :status => :created, :location => @ads_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ads_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @ads_type = AdsType.find(params[:id])

    respond_to do |format|
      if @ads_type.update_attributes(params[:ads_type])
        format.html { redirect_to @ads_type, :notice => 'Ads type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ads_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @ads_type = AdsType.find(params[:id])
    respond_to do |format|
      if @ads_type.destroy
        format.html { redirect_to ads_types_url }
      else
        format.html { redirect_to ads_types_url,  :notice => 'Cannot delete last ads type' }
      end
    end
  end

  private
  def ads_type_params
    params.require(:ads_type).permit(:name)
  end
end