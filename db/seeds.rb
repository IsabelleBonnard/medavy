require 'csv'
# require_relative "qcm_medavy.csv"

Choice.destroy_all
Question.destroy_all

filepath = Rails.root.join('db', 'qcm_medavy_3.csv')
csv_text = File.read(filepath, :encoding => 'utf-8')
csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
csv = CSV.parse(csv_text, csv_options)
csv.each do |row|
 question = Question.new(intitule: row['Intitule'], answer: row['Answer'])
 question.save
 question.id % 10 == 0 ? question.beautiful_id = 10 : question.beautiful_id = question.id % 10
 question.save
 choice_1 = Choice.new(intitule: row['Choice 1'], correct: true)
 choice_1.question = question
 choice_1.save
 choice_2 = Choice.new(intitule: row['Choice 2'], correct: false)
 choice_2.question = question
 choice_2.save
 choice_3 = Choice.new(intitule: row['Choice 3'], correct: false)
 choice_3.question = question
 choice_3.save
 choice_4 = Choice.new(intitule: row['Choice 4'], correct: false)
 choice_4.question = question
 choice_4.save
end

