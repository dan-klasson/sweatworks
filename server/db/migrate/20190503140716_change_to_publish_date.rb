class ChangeToPublishDate < ActiveRecord::Migration[5.2]
  def change
    remove_column :publications, :date
    remove_column :publications, :time
    add_column :publications, :published_at, :datetime
  end
end
