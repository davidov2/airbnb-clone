class AdsController < ApplicationController



 def index
  @ads = Ad.all
 end

 def show
   find_ad
 end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(ad_params)
    # @ad.user = current_user
    @ad.save
    redirect_to ads_path
  end

  def edit
    find_ad
  end

  def update
    find_ad
    @ad.update(ad_params)
    @ad.save
    redirect_to ads_path
  end

  def destroy
    find_ad
    @ad.destroy
    redirect_to ads_path
  end



#--------------------------------------------------------


  private
# # update et create
  def ad_params
    params.require(:ad).permit(:description, :date, :price, :flight_date, :photo, :photo_cache)
  end

  def find_ad
    @ad = Ad.find(params[:id])
  end




end
