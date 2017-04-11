class QuizzRecordsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @quizz_records = QuizzRecord.all
    @quizz_record = QuizzRecord.new
    @quizz_record.length = (DateTime.now - params[:start_date].to_datetime)*24*60
    @quizz_record.correct = params[:correct].to_i
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
