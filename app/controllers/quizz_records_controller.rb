class QuizzRecordsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @quizz_records = QuizzRecord.all.sort_by { |quizz_record| -quizz_record.score }
    @quizz_record = QuizzRecord.new
    @quizz_record.length = (DateTime.now - session[:start_date].to_datetime)*24*60
    @quizz_record.correct = session[:question_1] + session[:question_2] + session[:question_3] + session[:question_4] + session[:question_5] + session[:question_6] + session[:question_7] + session[:question_8] + session[:question_9] + session[:question_10]
    @quizz_record.score = score(@quizz_record.length, @quizz_record.correct)
    @quizz_record.date = DateTime.now
  end

  def create
    @quizz_record = QuizzRecord.new(params_quizz_record)
    @quizz_record.save
    redirect_to quizz_path
  end

  def params_quizz_record
    params.require(:quizz_record).permit(:username, :length, :correct, :score, :date)
  end

  def score(length, correct)
    if length > 4
      length_score = 0
    elsif length < 0.4
      length_score = 1
    else
      length_score = (4 - length) / (4 - 0.4)
    end
    return correct.to_f * length_score
  end
end
