class CreateQuizzRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :quizz_records do |t|
      t.string :username
      t.float :length
      t.integer :correct
      t.float :score
      t.datetime :date
      t.timestamps
    end
  end
end
