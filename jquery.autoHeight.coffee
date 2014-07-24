$ = jQuery

$.fn.autoHeight = (options) ->

    self = this

    timeout = null

    settings = $.extend(
        selector: '> *'
    , options)


    run =  ->
        selectors = []
        # Check for multiple selectors
        if $.isArray settings.selector
            for selector in settings.selector
                selectors.push $(selector, self)
        else
            selectors.push $(settings.selector, self)
        # Loop through selectors
        for $items in selectors
            if ($items.length > 1)
                maxHeight = 0
                parentWidth = parseInt(self.innerWidth(), 10)
                affectedItems = []

                $items.each ->
                    itemWidth = parseInt($(this).outerWidth(), 10)
                    $(this).height 'auto'
                    if itemWidth < parentWidth
                        maxHeight = $(this).height() if $(this).height() > maxHeight
                        affectedItems.push $(this)

                if maxHeight > 0
                    for $item in affectedItems
                        $item.height maxHeight

        self.trigger 'complete', settings

    run()
    
    self.resize ->
        timeout = timeout || setTimeout ->
            run()
            timeout = null
        , 200

    return this
