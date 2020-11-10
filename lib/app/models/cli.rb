require "tty-prompt"
require "pry"
require 'rest-client'  
require 'json' 

class CLI

    @@prompt = TTY::Prompt.new
    @@artii = Artii::Base.new :font => 'slant'

    def welcome # launches auth flow and prints welcome graphic
        system('clear')
        puts @@artii.asciify("Welcome to")
        puts @@artii.asciify("Spotify ( Lite )!")
        sleep(1)
<<<<<<< HEAD
        puts "\n"
        self.display_menu
    end

    def display_menu # this displays initial log-in menu
=======
        self.display_menu
    end

    def display_menu
>>>>>>> 76fcfe61b09efe11cad4d17fc950dcccaf45efc2
        choices = { "Log in" => 1, "Sign up" => 2}
        action = @@prompt.select("What would you like to do?", choices)
        case action
        when 1
            puts "Please enter your username:"
            username = gets.chomp
            self.authenticate_username(username)
        when 2
            puts "Please enter a new username:"
            username = gets.chomp
            self.setup_username(username)
        end
    end

    def setup_username(username) # username setup for new users
        if User.all.any? { |user| user.username == username }
            puts "Oops! That name is already taken."
            sleep(2)
            puts "Please enter another username:"
            new_username = gets.chomp
            self.setup_username(new_username)
        else
            puts "Perfect. Please create a password:"
            password = gets.chomp
            User.create(username: username, password: password)
            sleep(2)
            puts "You're all set. We are excited to have you!"
            self.launch_dashboard
        end
    end

    def authenticate_username(username) # authenticate reutrning users' usernames
        if User.all.any? { |user| user.username == username }
            puts "Please enter your password:"
            password = gets.chomp
            self.authenticate_password(username, password)
        else
            puts "We don't recognize that username. Please re-enter your username:"
            username = gets.chomp
            self.authenticate_username(username)
        end
    end
    
    def authenticate_password(username, password) # authenticate reutrning users' passwords
        if User.all.any? { |user| user.username == username && user.password = password }
            puts "Welcome back!"
            self.launch_dashboard
        else
            puts "We don't recognize that password. Please re-enter your password:"
            new_password = gets.chomp
            self.authenticate_username(username, new_password)
        end
    end

    def launch_dashboard # launch main menu
        system('clear')
<<<<<<< HEAD
        puts @@artii.asciify("Main Menu")
        choices = { "My Library" => 1, 
                "Create New Playlist" => 2, 
                "Search All Playlists" => 3,
                "Exit" => 4
            }
=======
        choices = { "My Library" => 1, "Create New Playlist" => 2, "Search All Playlists" => 3}
>>>>>>> 76fcfe61b09efe11cad4d17fc950dcccaf45efc2
        action = @@prompt.select("Choose an option:", choices)
        case action
        when 1
            puts "Here are your dope playlists"
        when 2
            puts "Let's create playlist"
        when 3
            self.search_playlists
<<<<<<< HEAD
        when 4
            system('clear')
            return 
        end
    end

    def search_playlists # main search playlists menu
        system('clear')
        puts @@artii.asciify("Playlists")
        puts "\n"
        choices = { "Search All" => 1, 
                "Search By Genre" => 2, 
                "Search by Name" => 3,
                "Main Menu" => 4
            }
=======
        end
    end

    def search_playlists
        system('clear')
        choices = { "Search All" => 1, "Search By Genre" => 2, "Search by Name" => 3}
>>>>>>> 76fcfe61b09efe11cad4d17fc950dcccaf45efc2
        action = @@prompt.select("Choose an option:", choices)
        case action
        when 1
            self.search_all_playlists
        when 2
            self.search_by_genre
        when 3
            self.search_by_name
<<<<<<< HEAD
        when 4
            self.launch_dashboard 
        end
    end
    
    def search_all_playlists # allows users to select from all playlists 
=======
        end
    end
    
    def search_all_playlists
>>>>>>> 76fcfe61b09efe11cad4d17fc950dcccaf45efc2
        counter = 1
        choices = {}
        Playlist.all.select do |playlist|
            choices[playlist.name] = counter
            counter += 1
        end
        action = @@prompt.select("Choose a playlist:", choices)
<<<<<<< HEAD
        case action
        when action
            puts "Good picks" # open playlist based on actions
        end
    end

    def search_by_genre

        # initialize hashes and counters
        first_counter = 1
        second_counter = 1
        genre_choices = {}
        playlist_choices = {} 

        # select genre flow
        genres = Playlist.all_genres
        genres.select do |genre|
            genre_choices[genre] = first_counter
            first_counter += 1
        end
        action_1 = @@prompt.select("Choose a genre:", genre_choices)

        # based on genre, display playlists
        playlists  = Playlist.find_by_genre(genre_choices.key(action_1))
        playlists.select do |playlist|
            playlist_choices[playlist.name] = second_counter
            second_counter += 1
        end
        action_2 = @@prompt.select("Choose a playlist:", playlist_choices)

        # based on selected playlist, output songs
        selected_playlist_name = playlist_choices.key(action_2)
        selected_playlist = Playlist.all.find{|playlist| playlist.name == selected_playlist_name}
        case action_2
        when action_2
            puts selected_playlist.tracks # not working rn 
            # add functionality to add to my playlists
=======
        # open playlist? based on action
    end

    def search_by_genre
        counter = 1
        choices = {}
        genres = Playlist.all_genres # confirm syntax with Ben
        genres.all.select do |genre|
            choices[genre] = counter
            counter += 1
>>>>>>> 76fcfe61b09efe11cad4d17fc950dcccaf45efc2
        end
        action = @@prompt.select("Choose a genre:", choices)
        Playlist.find_by_genre(choices.key(action))
        # open playlist? based on action
    end

end