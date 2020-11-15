require 'faker'

def content_params
  random = Random.rand(-5..5)

  {
    "published_date" => random.days.from_now.to_date,
    "title" => Faker::Book.title,
    "author" => Faker::Book.author,
    "summary" => Faker::Lorem.sentence,
    "content" =>  Faker::Lorem.paragraphs(10).join(" "),
    "status" => "draft"
  }
end

puts "seeding db"

(1..10).each do
  content = Content.create(content_params)
  time = content.time_to_publish.seconds.from_now
  puts time
  content.delay(run_at: time).post!
  puts "Content created: #{content.title}"
end

puts "Finished seeding"

