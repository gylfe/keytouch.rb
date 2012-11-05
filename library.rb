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

        line = "10文字 x 03行".on_blue.bold
        puts "\nもんだいすう\n=> #{line}\n\n\nはじめるよ？ [えんたー]"
        abs = gets
        count.each do |i|
            system "clear"
            puts i
            sleep 1
        end
        system "clear"
    end
    
    def select
        printf "--- "*3
        printf "\n0.sample mode\n1.100char mode\n2.200char mode\n3.quit\n"
        printf "--- "*3
        printf "\nchoose mode: "

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
        puts "**************************".blink
        puts "しゅうりょー\s\s\s(・ω・ )"
        puts "よくできたね？"
        puts "**************************".blink
    end
end

class Mondai
    def initialize
        @lefty = "qazwsxedcrfvtgby".upcase
        @code = ""
        @score = 0
    end

    def window_t
        print "左".blue + ":" + "右".magenta + "\n"*2
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
        time = sprintf("%0.1f", @score).on_red.bold
        print("TIME\n=> " + time + "\sびょう\n\n")
    end
end
