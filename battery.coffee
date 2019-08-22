command: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d'%'"

refreshFrequency: 150000 # ms

render: (output) ->
  if output > 50
    "bat <span style='color:#aaa'>#{output}%</span>"
  else if output < 51 && output > 15
    "bat <span style='color:#d79921'>#{output}%</span>"
  else
    "bat <span style='color:#cc241d'>#{output}%</span>"

style: """
  -webkit-font-smoothing: antialiased
  font: 11px Menlo
  top: 18px
  right: 70px
  color: #eee8d5
"""
