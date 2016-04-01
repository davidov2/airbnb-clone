class RemoveTypetoAds < ActiveRecord::Migration
  def change
    add_column :ads, :ulm_type, :string

  end
end
