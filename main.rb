require 'pony'
require 'gemoji'
require_relative 'rent_reminder' # links relative module to main.rb
require_relative 'message_sender'# links relative module to main.rb
require_relative 'shopping_list' # links relative module to main.rb

smiley = Emoji.find_by_alias("smiley").raw #assigns the 'gemoji' smiley emoji to a variable

puts """Oh hi there #{smiley}
Tenant tasker is here to save the day! 
"""
sleep 1

while true
    print """
    What would you like to use Tenant Tasker for?
    =============================================
    1. Rent Reminder
    2. Passive Agressive Message Sender
    3. Create a shopping list
    """

    choice = gets.strip.to_i

    if choice == 1
        rent_reminder_method # calls the rent reminder method in the rent_reminder.rb module
        sleep 2
        print "Would you like to use Tenant Tasker for anything else? Y/N?"
        next_choice = gets.strip.downcase
        if next_choice == "y"
            puts "Let's go again"
        else
            puts "Have a great day!" 
            break
        end
    elsif choice == 2
        message_sender_method # calls the message sender method in the message_sender.rb module
        sleep 2
        print "Would you like to use Tenant Tasker for anything else? Y/N?"
        next_choice = gets.strip.downcase
        if next_choice == "y"
            puts "Let's go again"
        else
            puts "Have a great day!" 
            break
        end
    elsif choice == 3
        shopping_list_method # calls the rent shopping list method in the shopping_list.rb module
        sleep 2
        print "Would you like to use Tenant Tasker for anything else? Y/N?"
        next_choice = gets.strip.downcase
        if next_choice == "y"
            puts "Let's go again"
        else
            puts "Have a great day!" 
            break
        end
    else
        puts "Oops! Please try again."
    end
end


