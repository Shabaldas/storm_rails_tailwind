class WidgetsController < InheritedResources::Base
  def index
    @pagy, @widgets = pagy(Widget.all, items: 100)
    # respond_to do |format|
    #   format.turbo_stream do
    #     render turbo_stream: turbo_stream.append(:widgets, partial: "widgets/pager",
    #       locals: { widget: @widget })
    #   end
    # end
  end

  private

  def widget_params
    params.require(:widget).permit(:name)
  end
end
