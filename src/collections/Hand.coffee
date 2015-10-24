class window.Hand extends Backbone.Collection
  model: Card

  hasTurnedOver: false

  initialize: (@array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    @last()
    if @isDealer == undefined
      if @compare() > 21
        console.log("DEALER WINS!")

  stand: (playerHand) ->
    if @hasTurnedOver == false
      @array[0].flip()
      @hasTurnedOver = true

    playerScore = playerHand.compare()
    dealerScore = @compare()

    

    if dealerScore > playerScore and dealerScore > 17
      $(".winner").text("DEALER WINS!")
      console.log("DEALER WINS!")
      # trigger game end
    else
      while dealerScore < 17
        @hit()
        dealerScore = @compare()
      if dealerScore >= 17 and dealerScore <= 21 and dealerScore > playerScore
        $(".winner").text("DEALER WINS!")
      else if dealerScore == playerScore
        $(".winner").text("PUSH!")
        console.log("PUSH!")
      else
        $(".winner").text("PLAYER WINS!")
        console.log("PLAYER WINS!")

  compare: ->
    if Math.max(@scores()[0], @scores()[1]) > 21
      return @scores()[0]
    else
      return @scores()[1]

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

