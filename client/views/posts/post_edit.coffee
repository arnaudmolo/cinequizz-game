Template.postEdit.events
  'submit form': (e) ->
    do e.preventDefault

    currentPostId = @_id
    $el = $ e.target

    postProperties =
      url: do $el.find('[name=url]').val
      title: do $el.find('[name=title]').val

    Posts.update currentPostId, $set: postProperties, (err) ->
      if err
        return alert error.reason

      Router.go 'postPage', _id: currentPostId

  'click .delete': (e) ->
    do e.preventDefault

    if confirm "Delete this post?"
      currentPostId = @_id
      Posts.remove currentPostId
      Router.go 'postsList'
