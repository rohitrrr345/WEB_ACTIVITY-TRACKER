class CreateActivityLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :url, null: false
      t.integer :duration, null: false

      t.timestamps
    end
  end
end
