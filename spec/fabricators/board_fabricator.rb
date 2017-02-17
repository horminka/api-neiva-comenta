Fabricator(:board) do
  name  { FFaker::Lorem.word }
  description  { FFaker::Lorem.phrase }
end

Fabricator(:board_with_five_topics, from: :board) do
  topics(count: 5) { Fabricate.build(:topic, board: nil) }
end

Fabricator(:board_with_five_topics_with_posts, from: :board) do
  topics(count: 5) { Fabricate.build(:topic_with_posts, board: nil) }
end
