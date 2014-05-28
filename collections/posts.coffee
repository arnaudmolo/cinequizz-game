@Posts = Posts = new Meteor.Collection 'posts'

Posts.allow
  insert: ownsDocument
  remove: ownsDocument

Posts.deny
  update: (userId, post, fieldNames) ->
    (_.without fieldNames, 'url', 'title').length > 0

Meteor.methods
  post: (postAttributes) ->
    user = Meteor.user()
    postWithSameLink = Posts.findOne url: postAttributes.url

    unless user
      throw new Meteor.error 422, 'You need to be logged'

    unless postAttributes.title
      throw new Meteor.error 422, 'No title'

    if postAttributes.url and postWithSameLink
      throw new Meteor.error 422, 'Link already posted', postWithSameLink._id

    post = _.extend _.pick(postAttributes, 'url', 'title', 'message'),
      userId: user._id
      author: user.username
      submitted: new Date().getTime()

    Post.insert post
