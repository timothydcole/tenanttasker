def shopping_list_method #method called on main.rb page
    puts "Let's get your shopping list together. "
    sleep 1

    shopping_list = [] 

    def shopping_list_print arr #method to print each value of array
        arr.each_with_index do |item, index| 
            puts "#{index + 1}) #{item}"
        end
    end

    while true
        print "What would you like to add to your shopping list? "
        grocery_item = gets.strip
        shopping_list.push(grocery_item)
        print "Would you like to add anything else? Y/N"
        next_choice = gets.strip.downcase
        if next_choice == "y"
        else
            puts "Your shopping list is:"
            shopping_list_print(shopping_list)
            break
        end
    end
end