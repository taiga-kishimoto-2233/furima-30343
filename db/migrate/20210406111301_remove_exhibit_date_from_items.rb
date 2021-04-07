class RemoveExhibitDateFromItems < ActiveRecord::Migration[6.0]
  def up
    remove_column :items, :exhibit_date
  end

  def down
    add_column :items, :exhibit_date, :integer
  end
end
