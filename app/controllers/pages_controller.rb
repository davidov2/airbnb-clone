class PagesController < ApplicationController
  def home
    ad = Ad.count
    @ads = Ad.all.sort[ad-9..ad].reverse

  #si la date du vol est supérieur à la date.now on incremente un conmpteur de 1 dans une boucle
  @ads_counter = 0
  Ad.all.each do |c|
    if c.flight_date > DateTime.now
      @ads_counter = @ads_counter + 1
    end
  end
   return @ads_counter
  end
end
