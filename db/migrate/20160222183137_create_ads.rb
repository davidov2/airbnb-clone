class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
