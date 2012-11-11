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

        line = "10 characters x 03 lines".on_blue.bold
        system "clear"
        mission = "Mission".split(//)
        puts ""
        sleep 0.3
        mission.each do |ch|
            sleep 0.20
            print ch
        end
        sleep 0.9
        print "\n="
        sleep 0.45
        print ">"
        sleep 0.45
        print "\s#{line}"
        sleep 0.6
        puts "\n\n"
        3.times do
            sleep 0.28
            print '.'
        end
        sleep 0.5
        print "Go Ahead? [Yy]"
        abs = gets(1)
        count.each do |i|
            system "clear"
            puts i
            sleep 0.92
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

end

class Mondai
    def initialize
        @lefty = "qazwsxedcrfvtgby".upcase
        @code = []
    end

    def window_t
        print "左".blue + ":" + "右".magenta + "\n"*2
    end

    def window_l
        print "\s"*10
    end

    def make_mondai
        @code = (("A".."Z").to_a).shuffle[0..9]
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
        time = sprintf("%0.1f", @score).on_red.bold.blink
        sleep 0.2
        puts("Mission Complete!")
        sleep 0.7
        print("TIME is")
        sleep 0.3
        3.times do
            sleep 0.2
            print '.'
        end
        sleep 0.4
        print ("\n=> " + time + "\ssec.\n\n")
    end
end
