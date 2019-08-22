command: "date +\"%A, %b %d - %H:%M\""

refreshFrequency: 1000

render: (output) ->
  "<div class='date'>#{output}</div>"

style: """
  -webkit-font-smoothing: antialiased
  color: #eee8d5
  font: 12px Menlo
  top: 18px
  width: 100%

  .date
    text-align: center
"""
