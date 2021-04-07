class AddExhibitDateIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :exhibit_date_id, :integer, null: false
  end
end
