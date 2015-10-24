class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes    
    address = "url(img/cards/" + @model.attributes.rankName.toString().toLowerCase() + "-" + @model.attributes.suitName.toLowerCase() + ".png)"
    @$el.css("background-image", address)
    console.log(address)
    @$el.css("background-size", "100px 140px")
    @$el.addClass 'covered' unless @model.get 'revealed'