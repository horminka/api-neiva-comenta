Fabricator(:post) do
  content { FFaker::Lorem.paragraphs }
  image  { FFaker::Lorem.phrase }
  topic
end
