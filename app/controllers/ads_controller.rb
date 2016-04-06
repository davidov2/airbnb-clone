class AdsController < ApplicationController


 def index
  # @ads = Ad.all
  # authorize @ad
  @ads = policy_scope(Ad)
 end

 def show
   find_ad
   @markers = Gmaps4rails.build_markers(@ad) do |ad, marker|
      marker.lat ad.latitude
      marker.lng ad.longitude
    end

 end

  def new
      #@ad = Ad.new
      #si le user est un pilote il peut faire une annonce sinon il doit s'identifier comme pilote et remplir son profil

    if user_signed_in? && current_user.pilote?
      #@ad = Ad.new
      @ad = current_user.ads.build
      authorize @ad
    else
      redirect_to new_user_registration_path
    end

  end

  def create
    # @ad = Ad.new(ad_params)
    # @ad.user = current_user
    @ad = current_user.ads.build(ad_params)
    authorize @ad

    if @ad.save
      redirect_to root_path, notice: 'Annonce crée avec succès'
    else
      render :new
    end
  end

  def edit
    find_ad
  end

  def update
    find_ad
    @ad.update(ad_params)
    if @ad.save
      redirect_to ads_path, notice: 'Annonce updatée avec succès'
    else
      render :edit
    end
  end

  def destroy
    find_ad
    @ad.destroy
    redirect_to ads_path
  end

  def search
    city = params[:q]
    @ads = Ad.near(city, 50, :units => :km)
    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@ads) do |ad, marker|
      marker.lat ad.latitude
      marker.lng ad.longitude
    end
  end

#--------------------------------------------------------
  private
# # update et create
  def ad_params
    params.require(:ad).permit(:description, :date, :price, :flight_date, :flight_time, :address, :photo, :photo_cache, :category)
  end

  def find_ad
    @ad = Ad.find(params[:id])
    authorize @ad
  end

end
