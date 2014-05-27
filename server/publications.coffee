Meteor.publish 'posts', () ->
  do Posts.find
