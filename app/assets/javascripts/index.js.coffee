Array::shuffle = -> this.sort -> 0.5 - Math.random()
$('#logo').hover ->
    @text = 'FAF-labs'
    window.indexes = [0..@text.length-1].shuffle()
    $(this).text ""
    for i in [0..@text.length-1]
        @delta = (i - window.indexes[i])*0.5
        $newElem = $('<span class="letter" style="left:'+i*0.5+'em;"></span>')
        $newElem.text @text[i]
        $(this).append $newElem
        $newElem.animate {left: "-="+@delta+"em"}, 500
, ->
    @text = 'FAF-labs'
    $(this).html ""
    for i in [0..@text.length-1]
        @delta = (window.indexes[i] - i)*0.5
        $newElem = $('<span class="letter" style="left:'+i*0.5+'em;"></span>')
        $newElem.text @text[window.indexes[i]]
        $(this).append $newElem
        $newElem.animate {left: "+="+@delta+"em"}, 500

