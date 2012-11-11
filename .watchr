# for "watchr" gem setting

def run
    system("clear; ruby ./keytouch.rb")
end

watch('.*\.rb'){run}
run
