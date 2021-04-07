class RemoveDateFromItems < ActiveRecord::Migration[6.0]
  def up
    remove_column :items, :date_id
  end

  def down
    add_column :items, :date_id, :integer
  end
end