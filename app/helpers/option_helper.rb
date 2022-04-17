module OptionHelper
  def available_colors(options)
    options.pluck(:value).map(&:downcase)
  end

  def select_colors
    {
      red: '#E9646B', green: '#96E06C',
      black: '#000000', white: 'white',
      yellow: '#F1C232', blue: '#67ACEC'
    }
  end
end
