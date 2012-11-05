# encoding: utf-8
require 'term/ansicolor'

class String
    include Term::ANSIColor
end

class Window
    def countdown
        count = ["
        ┏━━┓
        ┗━┓┃
        ┏━┛┃
        ┗━┓┃
        ┏━┛┃
        ┗━━┛
        ","
        ┏━━┓
        ┗━┓┃
        ┏━┛┃
        ┃┏━┛
        ┃┗━┓
        ┗━━┛
        ","
        ┏━┓
        ┗┓┃
         ┃┃
         ┃┃
         ┃┃
         ┗┛
        "]

        puts "はじめるよ？[Enter]"
        abs = gets
        count.each do |i|
            system "clear"
            puts i
            sleep 1
        end
        system "clear"
    end
    
    def select
        printf "--- --- ---\n0.sample mode\n1.100char mode\n2.200char mode\n3.quit\n--- --- ---\nchoose mode: "

        s = gets.to_i

        case s
            when 0
            when 1
               puts "under developping\n"
            when 2
               puts "under developping\n"
            when 3
               puts "goodbey!\n"
            else
              puts "prohibited!\n"
        end
    end

    def finished
        puts "************************".blink
        puts "しゅうりょー\s\s\s(・ω・ )"
        puts "よくできたね？"
        puts "************************".blink
    end
end

class Mondai
    def initialize
        @lefty = "qazwsxedcrfvtgbyh".upcase
        @code = ""
        @score = 0
    end

    def window_t
        print "Left".blue + ":" + "Right".magenta + "\n"*2
    end

    def window_l
        print "\s"*10
    end

    def make_mondai
        @code = (("a".."z").to_a).shuffle[0..9].join.upcase.split(//)
    end

    def question
        make_mondai
        window_l
        #color: black,red,green,yello,blue,magenta,cyan,white
        #option: underscore,negative,blink
        @code.each do |chr|
            if @lefty =~ /#{chr}/
                print chr.blue.bold
            else
                print chr.magenta.bold
            end
        end
        puts ""
    end

    def touching
        window_l
        i = 0
        while i < 10 do
            system "stty raw -echo"
            a = STDIN.getc.upcase
            if @code[i].chr == a then
                print a.black.bold
                i += 1
            end
        end
        system "stty -raw echo"
        puts "\n"*2
    end

    def three_time
        start = Time.now
        window_t
        3.times do
            question
            touching
        end
        stop = Time.now
        @score = stop - start
    end

    def score
        printf("kakattazikan => %0.1f", @score)
    end
end
