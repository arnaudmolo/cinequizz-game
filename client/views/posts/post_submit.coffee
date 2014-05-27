Template.postSubmit.events
  'submit form': (e) ->
    do e.preventDefault
    $el = $ e.target

    post =
      url: do $el.find('[name=url]').val
      title: do $el.find('[name=title]').val
      message: do $el.find('[name=message]').val

    Meteor.call 'post', post, (err, id) ->
      if err
        return alert error.reason

      Router.go 'postsList'
