# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # @set 'playerScore', 0


  nextRound: ->
    @usedCards = _.extends(@usedCards, @get('playerHand'), @get('dealerHand'))
    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()
    console.dir(@usedCards)

  scores:
    playerChips: 1000

  usedCards: {}

# fix next round