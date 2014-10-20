$ = jQuery

$.fn.autoHeight = (options) ->

  self = this

  # Timout to avoid multiple triggers when resizing
  timeout = null

  # Merge options with default settings
  settings = $.extend({
    selector: '> *'
  }, options)

  # Run auto height
  run =  ->
    selectors = []
    # Check for selector array
    if $.isArray settings.selector
      # Add jQuery object for each selector in array
      for selector in settings.selector
        selectors.push $(selector, self)
    else if typeof settings.selector == 'string'
      selectors.push $(settings.selector, self)

    # Loop through selectors
    for $items in selectors
      # Only process when item count is heigher than one (1)
      if ($items.length > 1)
        # Variable to store tallest item height in
        maxHeight = 0
        # Parent width to be used to check that items are'nt 100% wide
        parentWidth = parseInt(self.innerWidth(), 10)
        # Array to store items to resize
        affectedItems = []

        $items.each ->
          itemWidth = parseInt($(this).outerWidth(), 10)
          # Reset height
          $(this).height 'auto'

          # If item is not 100% wide
          if itemWidth < parentWidth
            # Add this item to affectedItems
            affectedItems.push $(this)

            # Store this this items height if it is taller than maxHeight
            maxHeight = $(this).height() if $(this).height() > maxHeight

        if maxHeight > 0
          # Resize affected items
          for $item in affectedItems
            $item.height maxHeight

    # Trigger autoHeightComplete event
    self.trigger 'autoHeightComplete', settings
  
  # Resize callback function
  resize = ->
    timeout = timeout || setTimeout ->
      run()
      timeout = null
    , 200

  # Run resize
  run()

  # Check for resize dependency
  if typeof window.addResizeListener == 'function'
    # Run dependency
    self.resize(resize)
  else
    # Run fallback, window resize
    $(window).resize(resize)


  return this