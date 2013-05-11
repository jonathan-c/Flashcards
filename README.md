Flashcards
==========

Ruby application built with the help of Thoughtbot Learn's "Advanced Ruby" video lesson.

Topics covered in this application include: Classes, Modules, local variables, instance variables, scope, blocks, arrays, hashes, inheritance.

== How to play

Instantiate a new card
card2 = Flashcards::Card.new("Hello", "hola")

Instantiate a card that accepts two different answers
card1 = Flashcards::MultipleAnswerCard.new("How are you?", "Como estas?,como estas")

Create a new deck
deck = Flashcards::Deck.new("Spanish")
deck << card1
deck << card2

Start the application
app = Flashcards::Application.new
app << deck
app.play
