class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!
  def intro
    @question = Question.first
    @quizz_records = QuizzRecord.all.sort_by { |quizz_record| -quizz_record.score }
  end

  def play
    @question = Question.find(params[:id])
    @choices = @question.choices.shuffle
    @first_question_id = Question.first.id
  end

  def result
    @quizz_records = QuizzRecord.all.sort_by { |quizz_record| -quizz_record.score}
  end
end
