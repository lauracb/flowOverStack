class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
