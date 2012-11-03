# encoding: utf-8
require 'term/ansicolor'

class String
  include Term::ANSIColor
end
 
printf "--- --- ---\n0.sample mode\n1.100char mode\n2.200char mode\n3.quit\n--- --- ---\nchoose mode: "

s = gets.to_i

case s
  when 0
    puts "はじめるよ？[Enter]"
    abs = gets
    system "clear"

    3.times do 
      code = (("a".."z").to_a).shuffle[0..9].join.upcase

      codea = code.split(//)

      left_hand = "qazwsxedcrfvtgby".upcase
      print "\s\s\s\s\s\s\s\s\s"

      codea.each do |chr|
        if left_hand =~ /#{chr}/
          print chr.blue.bold
        else
          print chr.red.bold
        end
      end

      puts ""

      #puts "" , code.blue.bold
      i = 0
      print "\s\s\s\s\s\s\s\s\s"
      while i < 10 do
        system "stty raw -echo"
        a = STDIN.getc.upcase
        if  code[i].chr == a then
          print a.green.bold
          i += 1
        end
      end
      system "stty -raw echo"
      puts "\n\n"
    end
    puts "*********************\nしゅうりょー(・ω <)/\nよくできたね？\n*********************"
  when 1
    puts "under developping\n"
  when 2
    puts "under developping\n"
  when 3
    puts "goodbey!\n"
  else
    puts "prohibited!\n"
  end
