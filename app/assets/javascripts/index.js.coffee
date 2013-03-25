# shuffle function
do -> Array::shuffle ?= ->
  for i in [@length-1..1]
    j = Math.floor Math.random() * (i + 1)
    [@[i], @[j]] = [@[j], @[i]]
  @

# global variables
$logo = $('#logo')
$letters = null

# on dom ready
$ ->
  # get container's letters
  @letters = $logo.text().split("")

  # init new container html
  @html = ""

  # create all letters
  for i in [0..@letters.length-1]
    @html += "<i data-index='#{i}' style='left:#{i*0.5}em'>#{@letters[i]}</i>"

  # insest letters in container
  $logo.html @html

  # cache letters
  $letters = $logo.children 'i'

$logo
  .mouseenter ->
    # shuffle indexes
    shuffled_indexes = [0..$letters.length-1].shuffle()

    # animate letters to new positions
    $letters.each (index, letter) ->
      position = shuffled_indexes[index]
      delta = (index - position)*0.5
      $(letter).stop(true).animate {left: "-="+delta+"em"}, 500

  .mouseleave ->
    # animate letters to old positions
    $letters.each (index, letter) ->
      $letter = $(letter)
      delta = $letter.data('index')*0.5
      $letter.stop(true).animate {left: delta+"em"}, 500

