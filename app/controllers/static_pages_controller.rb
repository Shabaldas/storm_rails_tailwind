class StaticPagesController < ApplicationController
  def home
    @call_question = CallQuestion.new
  end

  def modeling; end

  def rendering; end

  def print; end

  def save_phone_number
    @call_question = CallQuestion.new
    ap @call_question
    ap @call_question.assign_attributes(call_question_params)
   ap @call_question.valid?
   pp @call_question.errors.full_messages
    # respond_to do |format|
    #   format.turbo_stream do
    #     render turbo_stream: turbo_stream.replace('print_model_id_field', partial: 'question_form')
    #   end
    # end
  end

  private

  def call_question_params
    params.require(:call_question).permit(:phone_number)
  end
end
