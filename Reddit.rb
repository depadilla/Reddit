require "HTTP"

print "Enter the name of a subreddit: "

# dogswithjobs

sub_reddit = gets.chomp.to_s

response = HTTP.get("https://www.reddit.com/r/#{sub_reddit}/.json")


subreddit_info = response.parse
posts = subreddit_info["data"]["children"].length

index = 0
bullet = 1
posts.times do
  puts " "
  puts "#{bullet}) " + subreddit_info["data"]["children"][index]["data"]["title"].to_s
  puts " "
  index += 1
  bullet += 1
end

print "Choose section: "

section = gets.chomp.to_s

id = 

comments = HTTP.get("https://www.reddit.com/r/#{sub_reddit}/comments/aou8i7/#{section}/.json")

comments_info = comments.parse

all_comments = comments_info[1]["data"]["children"].length


index2 = 0
bullet2 = 1
all_comments.times do
  puts " "
  one_comment = comments_info[1]["data"]["children"][index2]["data"]["body"]
  puts "#{bullet2}) " + one_comment
  index2 += 1
  bullet2 += 1
end
