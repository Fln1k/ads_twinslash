class AdsController < ApplicationController

  def index
    @ads = Ad.with_states(:published).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @types = AdsType.all
    respond_to do |format|
      format.html
      format.json { render :json => @ads }
    end
  end

  def show

    @ad = Ad.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @ad }
    end
  end

  def new
    @ad = Ad.create :ads_type_id => AdsType.first.id, :user_id => current_user.id, :state => 1
    @ads_types = AdsType.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ad }
    end
  end

  def edit
    @ad = Ad.find(params[:id])
    @ads_types = AdsType.all
  end

  def create
    @ad = Ad.new(params[:ad])
    respond_to do |format|
      if @ad.save and @ad.images.attach(params[:ad][:images])
        format.html { redirect_to @ad, :notice => 'Ad was successfully created.' }
        format.json { render :json => @ad, :status => :created, :location => @ad }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @ad = Ad.find(params[:id])
    @ads_types = AdsType.all
    respond_to do |format|
      if @ad.update_attributes(params[:ad])
        format.html { redirect_to @ad, :notice => 'Ad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy

    respond_to do |format|
      format.html { redirect_to ads_url }
      format.json { head :no_content }
    end
  end

  def myads
    @ads = Ad.where(:user_id => current_user.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 10) #sort, paginate
    @types = AdsType.all
    respond_to do |format|
      format.html
        format.json { render :json => @ads }
    end
  end

  def new_ads
    @ads = Ad.with_states(:new).order("created_at DESC").paginate(:page => params[:page], :per_page => 10) #sort, paginate
    @types = AdsType.all
    respond_to do |format|
      format.html
      format.json { render :json => @ads }
    end
  end

  def archive_ads
    @ads = Ad.with_states(:archived).order("created_at DESC").paginate(:page => params[:page], :per_page => 10) #sort, paginate
    @types = AdsType.all
    respond_to do |format|
      format.html
      format.json { render :json => @ads }
    end
  end

  def approved_ads
    @ads = Ad.with_states(:approved).order("created_at DESC").paginate(:page => params[:page], :per_page => 10) #sort, paginate
    @types = AdsType.all
    respond_to do |format|
      format.html
      format.json { render :json => @ads }
    end
  end

  def ad_params
    params.require(:ad).permit(:name,:description,:ads_type_id, images: [])
  end
end