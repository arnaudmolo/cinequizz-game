requireLogin = (stop) ->

  unless do Meteor.user
    if do Meteor.loggingIn
      @render @loadingTemplate
    else
      @render 'accessDenied'
    do stop

Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  waitOn: () ->
    Meteor.subscribe 'posts'

Router.map () ->

  @route 'channelsList',
    path: '/'

  @route 'channelPage',
    path: '/channel/:categorie'
    data: () -> Channels.findOne categorie: @params.categorie
