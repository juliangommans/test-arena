MyApp = new (Backbone.Marionette.Application)
MyApp.addRegions mainRegion: '#content'
AngryCat = Backbone.Model.extend(
  defaults: votes: 0
  addVote: ->
    @set 'votes', @get('votes') + 1
    return
  rankUp: ->
    @set rank: @get('rank') - 1
    return
  rankDown: ->
    @set rank: @get('rank') + 1
    return
)
AngryCats = Backbone.Collection.extend(
  model: AngryCat
  initialize: (cats) ->
    rank = 1
    self = this
    _.each cats, (cat) ->
      console.log cat
      cat.rank = rank
      ++rank
      return
    @on 'add', (cat) ->
      if !cat.get('rank')
        error = Error('Cat must have a rank defined before being added to the collection')
        error.name = 'NoRankError'
        throw error
      return
    MyApp.on 'rank:up', (cat) ->
      if cat.get('rank') == 1
        return true
      self.rankUp cat
      self.sort()
      self.trigger 'reset'
      return
    MyApp.on 'rank:down', (cat) ->
      if cat.get('rank') == self.size()
        return true
      self.rankDown cat
      self.sort()
      self.trigger 'reset'
      return
    MyApp.on 'cat:disqualify', (cat) ->
      disqualifiedRank = cat.get('rank')
      catsToUprank = self.filter((cat) ->
        cat.get('rank') > disqualifiedRank
      )
      catsToUprank.forEach (cat) ->
        cat.rankUp()
        return
      self.trigger 'reset'
      return
    return
  comparator: (cat) ->
    cat.get 'rank'
  rankUp: (cat) ->
    rankToSwap = cat.get('rank') - 1
    otherCat = @at(rankToSwap - 1)
    cat.rankUp()
    otherCat.rankDown()
    return
  rankDown: (cat) ->
    rankToSwap = cat.get('rank') + 1
    otherCat = @at(rankToSwap - 1)
    cat.rankDown()
    otherCat.rankUp()
    return
)
AngryCatView = Backbone.Marionette.ItemView.extend(
  template: '#angry_cat-template'
  tagName: 'tr'
  className: 'angry_cat'
  initialize: ->
    @listenTo @model, 'change:votes', @render
    return
  events:
    'click .rank_up img': 'rankUp'
    'click .rank_down img': 'rankDown'
    'click a.disqualify': 'disqualify'
  rankUp: ->
    @model.addVote()
    MyApp.trigger 'rank:up', @model
    return
  rankDown: ->
    @model.addVote()
    MyApp.trigger 'rank:down', @model
    return
  disqualify: ->
    MyApp.trigger 'cat:disqualify', @model
    @model.destroy()
    return
)
AngryCatsView = Backbone.Marionette.CompositeView.extend(
  tagName: 'table'
  id: 'angry_cats'
  className: 'table-striped table-bordered'
  template: '#angry_cats-template'
  itemView: AngryCatView
  initialize: ->
    @listenTo @collection, 'sort', @renderCollection
    return
  appendHtml: (collectionView, itemView) ->
    collectionView.$('tbody').append itemView.el
    return
)
MyApp.addInitializer (options) ->
  angryCatsView = new AngryCatsView(collection: options.cats)
  MyApp.mainRegion.show angryCatsView
  return
$(document).ready ->
  cats = new AngryCats([
    {
      name: 'Wet Cat'
      image_path: 'assets/images/cat2.jpg'
      rank: 0
    }
    {
      name: 'Bitey Cat'
      image_path: 'assets/images/cat1.jpg'
      rank: 0
    }
    {
      name: 'Surprised Cat'
      image_path: 'assets/images/cat3.jpg'
      rank: 0
    }
  ])
  MyApp.start cats: cats
  cats.add new AngryCat(
    name: 'Cranky Cat'
    image_path: 'assets/images/cat4.jpg'
    rank: cats.size() + 1)
  return
