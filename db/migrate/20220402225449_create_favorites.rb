class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.boolean :is_favorite
      t.references :consumer,foreign_key: true
      t.references :service_provider ,foreign_key: true
      t.timestamps
    end
  end
end
