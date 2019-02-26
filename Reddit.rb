require "HTTP"

final_input = "no"

while final_input == "no" do 
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

  puts "The first permalink is #{subreddit_info["data"]["children"][0]["data"]["permalink"]}"

  print "Choose post: "

  section = gets.chomp.to_s

  comments = HTTP.get("https://www.reddit.com/r/#{sub_reddit}/comments/aou8i7/#{section}/.json")

  comments_info = comments.parse

  all_comments = comments_info[1]["data"]["children"].length


  index2 = 0
  bullet2 = 1
  all_comments.times do               #user still has to copy/paste the post they want to open, will need to change so the user inputs the number instead of the whole title.
    puts " "
    one_comment = comments_info[1]["data"]["children"][index2]["data"]["body"]
    puts "#{bullet2}) " + one_comment
    index2 += 1
    bullet2 += 1
  end


  print "Do you want to exit? Type 'yes' or 'no': "
  @final_input = gets.chomp.to_s

  if @final_input == "yes"
    system "clear"
  else
    system "clear"
  end
end




def get_comment
  comment = comments_info[1]["data"]["children"][index2]["data"]["permalink"]


end