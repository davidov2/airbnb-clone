class RenameUlmtypeToCategory < ActiveRecord::Migration
  def change
        rename_column :ads, :ulm_type, :category
  end
end
