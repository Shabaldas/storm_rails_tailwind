Option.all.destroy_all

%w[height weight length].each do |title|
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  option = Option.create(
      title: title,
      slug: slug,
      option_type: :radio_buttons,
      measurement: :mm
  )

  3.times do
    option.option_values.create(value: Faker::Number.between(from: 1, to: 100))
    print '.'.green
  end
end

color_option = Option.create(
    title: 'Color',
    slug: 'color',
    option_type: :radio_buttons,
    measurement: :color
)
5.times do
  color_option.option_values.create(value: Faker::Color.hex_color)
  print '.'.green
end
