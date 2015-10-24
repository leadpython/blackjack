class window.CardView extends Backbone.View
  className: 'card'

  template: _.template ''

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
    @$el.on("flip", @render)
    if @model.attributes.revealed == true
      address = "url(img/cards/" + @model.attributes.rankName.toString().toLowerCase() + "-" + @model.attributes.suitName.toLowerCase() + ".png)"
      @$el.css("background-image", address)
      console.log(address)
      @$el.css("background-size", "100px 140px")