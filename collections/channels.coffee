@Channels = Channels = new Meteor.Collection 'channels'

Channels.allow
  insert: () -> true
