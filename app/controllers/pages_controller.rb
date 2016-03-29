class PagesController < ApplicationController
  def home
    ad = Ad.count
    @ads = Ad.all.sort[ad-9..ad].reverse
  end
end
