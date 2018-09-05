require 'pony'
require 'rufus-scheduler'
require 'gemoji'

def rent_reminder_method #this method is called on the main.rb page

    smiley = Emoji.find_by_alias("smiley").raw
    moneybag = Emoji.find_by_alias("moneybag").raw

    housemate_names = []
    housemate_emails = []

    puts "Getting housemates to pay rent on time is a real drag #{moneybag}"
    sleep 1

    while true #obtaining housemate information
        print "Please enter your housemate's name: "
        housemate_name = gets.strip
        housemate_names.push(housemate_name)
        print "What is their email address? "
        housemate_email = gets.strip 
        housemate_emails.push(housemate_email)
        print "Do you have anymore housemates? Y/N? "
        anymore_housemates = gets.strip.downcase
        if anymore_housemates == "y"
            puts "Let's go again "
        else # getting rent information
            print "How much is your total monthly rent? " 
            monthly_rent = gets.strip.to_f
            print "What day of the month is rent due? "
            day_rent_due = gets.strip.to_i
            each_monthly_rent = monthly_rent / housemate_names.length
            puts "Awesome! You each pay #{each_monthly_rent} and will receive a reminder 3 days before rent is due #{smiley}"
            break
        end
    end

    day = day_rent_due - 3

    fork {
        scheduler = Rufus::Scheduler.new # schedules email to be sent at specific time
        scheduler.cron "0 10 #{day} * *" do
            housemate_emails.each do |email|
                # initialises email to be sent
                Pony.mail(
                    :to => email, 
                    :from => 'do_not_reply@tenanttasker.com', 
                    :html_body => "Hello, friendly reminder from your Tenant Tasker friends. \n Don't forget $#{each_monthly_rent} is due is 3 days time #{smiley}", 
                    :subject => 'You have a new Tenant Tasker Reminder')
            end
        end 
        scheduler.join
    }
end
 