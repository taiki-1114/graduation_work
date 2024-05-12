class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :question_body
      t.text :question_answer

      t.timestamps
    end
  end
end
