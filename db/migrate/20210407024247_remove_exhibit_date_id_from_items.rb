class RemoveExhibitDateIdFromItems < ActiveRecord::Migration[6.0]
  def up
    remove_column :items, :exhibit_date_id
  end

  def down
    add_column :items, :exhibit_date_id, :integer
  end
end
