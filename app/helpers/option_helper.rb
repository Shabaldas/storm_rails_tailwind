module OptionHelper
  def available_colors(options)
    options
  end

  def select_colors
    {
      '#FFFFFF': 'white',
      '#000000': 'black',
      '#808080': 'gray',
      '#00FF00': 'green',
      '#FF0000': 'red',
      '#FFFF00': 'yellow',
      '#0000FF': 'blue'
    }
  end
end
