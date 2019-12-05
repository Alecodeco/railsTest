class AddDescriptionToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :description, :text
    add_column :created_at, :updated_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
