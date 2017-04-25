puts 'Seeding tags'
10.times do |i|
  Tag.create(name: "Tag #{i + 1}")
end

puts 'Seeding categories'
5.times do |i|
  Category.create(name: "Category #{i + 1}")
end

tag_ids = Tag.pluck(:id)
category_ids = Category.pluck(:id)

puts 'Seeding posts'
100.times do |i|
  Post.create(
    title: "Post title #{i + 1}",
    text: 'Foo bar',
    category_id: category_ids.sample,
    tag_ids: tag_ids.sample(3)
  )
end

puts 'Done seeding'
