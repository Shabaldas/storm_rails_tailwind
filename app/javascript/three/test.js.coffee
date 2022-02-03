$(".premium-state").on "click", ->
  local_id = $(this).attr('id');
  $.ajax {
    url: ROUTE_TO_YOUR_ACTION
    type: 'post'
    dataType: 'script'
    success: () ->
  }