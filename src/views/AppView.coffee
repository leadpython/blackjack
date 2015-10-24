class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="nextRound">Next Round</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="winner"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': ->
      @model.get('dealerHand').stand(@model.get('playerHand'))
      @$(".nextRound").css("display", "inline")
      @$(".hit-button").css("display", "none")    
      @$(".stand-button").css("display", "none")
    'click .nextRound': ->
      @model.nextRound()
      @render()
      @$(".nextRound").css("display", "none")
      @$(".hit-button").css("display", "inline")
      @$(".stand-button").css("display", "inline")

    ## hears game end and resets the game

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el


