class StaticPagesController < ApplicationController
  def home
    @call_question = CallQuestion.new
  end

  def modeling; end

  def rendering; end

  def print; end

  def save_phone_number
    @call_question = CallQuestion.new(call_question_params)
    @call_question.save
  end

  private

  def call_question_params
    params.require(:call_question).permit(:phone_number)
  end
end
