class CorrectArticleDescription < ActiveRecord::Migration[7.1]
  def change
    rename_column :articles, :descrption, :description
  end
end
