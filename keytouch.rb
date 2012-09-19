# encoding: utf-8
require 'term/ansicolor'

class String
  include Term::ANSIColor
end
 
printf "--- --- ---\n0.sample mode\n1.100char mode\n2.200char mode\n3.quit\n--- --- ---\nchoose mode: "

s = gets.to_i

case s
  when 0
    3.times do 
      code=(("a".."z").to_a).shuffle[0..9].join
      
      puts "" , code.blue.bold
      i = 0
        while i < 10 do
          system "stty raw -echo"
          a = STDIN.getc 
          if  code[i].chr == a then
            print a.red.bold
            i += 1
          else
          ;;
          end
        end
        system "stty -raw echo"
        puts ""
    end
  when 1
    puts "under developping\n"
  when 2
    puts "under developping\n"
  when 3
    puts "goodbey!\n"
  else
    puts "prohibited!\n"
  end
