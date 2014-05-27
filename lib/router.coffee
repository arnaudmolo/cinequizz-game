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
  @route 'postsList', path: '/'

  @route 'postPage',
    path: '/posts/:_id'
    data: () ->
      Posts.findOne @params._id

  @route 'postSubmit',
    path: '/submit'
    onBeforeAction: requireLogin

  @route 'postEdit',
    path: 'posts/:_id/edit'
    data: () -> Posts.findOne @params._id
