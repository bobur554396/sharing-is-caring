$ ->
  handleNewPost = (event) ->
    event.preventDefault()
    formFields = makeFormRequest("../" + $(event.target).attr("path").toLowerCase() + "_post/new")
    handleModalOpen "#newPostModal"
    return
  handlePostSubmit = (event) ->
    event.preventDefault()
    formData = $("#newPostForm").serialize()
    $.ajax
      url: "/blogs/" + window.selectedBlogId + "/posts"
      type: "POST"
      data: formData
      success: (response) ->
        $("#newPostModal").modal "hide"
        addPostToPage response
        return

    return
  handleModalOpen = (selector) ->
    $newPostForm = $("#newPostForm")
    $newPostForm.html "<div class='formLoading'></div>"
    $(selector).modal "show"
    return
  makeFormRequest = (passedUrl) ->
    $.ajax
      url: passedUrl
      type: "GET"
      success: (response) ->
        $("#newPostForm").html response
        $("textarea#postDescriptionInput, textarea#postCaptionInput").markItUp mySettings
        $("#blogIdInputField").attr "value", window.selectedBlogId
        $filepicker = $("input[type=filepicker-dragdrop]")
        filepicker.constructWidget $filepicker[0]  if $filepicker.length
        return

    return
  addPostToPage = (serverResponse) ->
    $("#newPostModal").after serverResponse
    return
  putThatBackground = ->
    $background = $(".everythingWrapper")
    $background.css "background-image", "url(" + window.selectedBackground + ")"
    $background.css "background-size", "cover"
    return
  $(".dashboardNavbarButtons").on "click", ".newPostButton", handleNewPost
  $("#newPostModal").on "click", "#postInputButton", handlePostSubmit
  putThatBackground()
  return
