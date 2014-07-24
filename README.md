jquery.autoHeight
=================

**Simple plugin to resize sibling elements and/or children of sibling elements to the same as the height of the tallest of its kind found.**

## Dependencies 

This script is dependent on [sdecima](https://github.com/sdecima/)'s [detect element resize](https://github.com/sdecima/javascript-detect-element-resize) script. This is to enable detection of items resizing (eg. when you update them using AJAX or going from landscape to portrait in responsive mode) so that we can recalculate the height.

## Installation

You simply clone or download the source code from both projects here on GitHub and include `jquery.resize.js` and `jquery.autoHeight.js` after loading jQuery itself, like so:

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="jquery.resize.js"></script>
<script type="text/javascript" src="jquery.autoHeight.js"></script>
```

## Usage

jquery.autoHeight don't require any paramaters to work *out of the box*, you can however specify a different subselector than the default `'> *'`.

```javascript
$('.auto-height').autoHeight({
    // Item selector, can be either string or an array.
    selector: '> *'
});
```

## Examples

Say you have a product grid setup but the heights of each item vary, then this script could not be easier to use. 

#### Example markup:

```html
<ul>
    <li>
        <figure><img src="image.png" alt="some image"></figure>
        <header>Lorem ipsum dolor suscipit, ex.</header>
        <div class="price">£5.00</div>
    </li>
    <li>
        <figure><img src="image.png" alt="some image"></figure>
        <header>Quae suscipit.</header>
        <div class="price">£5.00</div>
    </li>
    <li>
        <figure><img src="image.png" alt="some image"></figure>
        <header>Cumque, repudiandae, delectus.</header>
        <div class="price">£5.00</div>
    </li>
</ul>
```

#### Example javascript:

```javascript
// Note that we are selecting the items parent
$(document).ready(function() {
    $('ul').autoHeight();
});
```

This will set the height of all the direct deccendents (in this case all `<li>` tags) of our jQuery object the same as the height of the tallest element found. Easy as pie ey? 

Let's say we'd want set the height of the `<figure>` and `<header>` instead of the `<li>` tag, well don't worry (be happy) that's easy too.

#### Example javascript:

```javascript
$(document).ready(function() {
    $('ul').autoHeight({
        selector: ['> li > figure', '> li > header']
    });
});
```

This will set the height of all the `<figure>` and `<header>` tags to the same height as the tallest element found of each selector.