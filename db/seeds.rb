require 'httparty'
# returns and array of top story ids
topStoriesURL = "https://hacker-news.firebaseio.com/v0/topstories.json?"
topStories = HTTParty.get(topStoriesURL).parsed_response

# returns url/titles for the first 10 top stories
for i in 0..10 
  storyURL = "https://hacker-news.firebaseio.com/v0/item/#{topStories[i]}.json"
  storyJSON = HTTParty.get(storyURL).parsed_response
  Post.create(title: storyJSON["title"], link: storyJSON["title"], upvotes: 0)
end

