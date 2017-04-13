class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  def intro
    @question = Question.first
    @quizz_records = QuizzRecord.all.sort_by { |quizz_record| -quizz_record.score }
    session[:question_1] = 0
    session[:question_2] = 0
    session[:question_3] = 0
    session[:question_4] = 0
    session[:question_5] = 0
    session[:question_6] = 0
    session[:question_7] = 0
    session[:question_8] = 0
    session[:question_9] = 0
    session[:question_10] = 0
  end

  def play
    @question = Question.find(params[:id])
    if @question.id == 1
      session[:start_date] = DateTime.now
    end
    @choices = @question.choices.shuffle
    @first_question_id = Question.first.id
  end

  def result
    @quizz_records = QuizzRecord.all.sort_by { |quizz_record| -quizz_record.score}
  end

  def incrementation
    question_id = params[:id]
    session[("question_" + question_id).to_sym] = 1
  end
end
