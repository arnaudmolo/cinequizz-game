Meteor.publish 'posts', () ->
  do Posts.find

Meteor.publish 'channels', () ->
  do Channels.find
