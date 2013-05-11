module Flashcards
  class Application
    def initialize
      @decks = []
    end
  
    def << deck
      @decks << deck
    end
  
    def play
      display_decks
      puts "Pick a deck: "
      deck = get_deck
      deck.play
    end
  
    def display_decks
      @decks.each { |deck| puts deck.name.capitalize }
    end
  
    def get_deck
      name = gets.chomp.downcase
      @decks.detect { |deck| deck.name == name }
    end
  end

  class Card
    attr_accessor :front, :back
  
    def initialize(front, back)
      @front = front
      @back = back.downcase
    end
  
    def correct?(guess)
      guess.downcase == @back
    end
  
    def play
      puts "#{front} >"
      guess = gets.chomp
      if correct?(guess)
        puts "Correct"
      else
        puts "Incorrect. The answer was #{back.capitalize}"
      end
    end
  end

  class MultipleAnswerCard < Card
    def correct?(guess)
      answers = @back.split(",")
      answers.any? { |answer| answer == guess }
    end
  end

  class Deck
    attr_reader :name, :cards
    def initialize(name)
      @name = name.downcase
      @cards = []
    end
  
    def <<(card)
      @cards << card
    end
  
    def shuffle
      @cards.shuffle!
    end
  
    def play
      shuffle
      @cards.each { |card| card.play }
    end
  end
end

card1 = Flashcards::MultipleAnswerCard.new("Diana's age", "5,5.5")
card2 = Flashcards::Card.new("Mom's birthday", "April 4")

deck = Flashcards::Deck.new("Family")
deck<<card1
deck<<card2


deck2 = Flashcards::Deck.new("Spanish")
card3 = Flashcards::Card.new("Hello", "hola")
deck2<<card3

app = Flashcards::Application.new
app<<deck
app<<deck2
app.play