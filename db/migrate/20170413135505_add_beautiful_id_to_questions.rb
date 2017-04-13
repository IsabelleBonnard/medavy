class AddBeautifulIdToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :beautiful_id, :integer
  end
end
