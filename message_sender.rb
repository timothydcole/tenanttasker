require 'pony'
require 'gemoji'

def message_sender_method #method called on main.rb page

    triumph = Emoji.find_by_alias("triumph").raw
    thumbs_up = Emoji.find_by_alias("thumbsup").raw

    puts "Someone's not happy #{triumph}"
    sleep 1
    print "Whom are you pissed off with? "

    bad_housemate = gets.strip

    print "What is their email address? "

    bad_housemate_email = gets.strip

    print "What's your message? "

    bad_housemate_message = gets.strip

    puts "Your message has been sent #{thumbs_up}"

    Pony.mail(:to => bad_housemate_email, #initialises email message to housemate
        :from => 'you_are_in_trouble@tenanttasker.com', 
        :html_body => "Hello #{bad_housemate}, sorry to have to tell you this... #{bad_housemate_message}", 
        :subject => 'A little birdie told me to tell you...')
end