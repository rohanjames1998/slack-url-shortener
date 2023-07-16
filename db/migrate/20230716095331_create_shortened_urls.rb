class CreateShortenedUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :shortened_urls do |t|
      t.string :full_url, unique: true, null: false
      t.string :short_url, unique: true, null: false

      t.timestamps
    end
  end
end
