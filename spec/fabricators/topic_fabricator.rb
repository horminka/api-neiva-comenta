Fabricator(:topic) do
  title { FFaker::Lorem.phrase }
  content { FFaker::Lorem.paragraphs }
  image  { FFaker::Lorem.phrase }
  board
end

Fabricator(:topic_with_posts, from: :topic) do
  #posts(count: 5) { Fabricate.build(:post, topic: nil) }
  posts(count: 5) { Fabricate.build(:post) }
end
