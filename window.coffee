commands =
  space: 'echo "$(./kira/scripts/spaces.sh)"'

command: "echo " +
  "$(#{ commands.space }):::"

refreshFrequency: 500 # ms

render: (output) ->
  [output, _, bg, c1] = output.split ':::'
  [mode, spaces, focused...] = output.split '|'
  spaces = (@format_active space, bg for space in (spaces.split ' ')).join('')
  """
  <div>
    #{spaces}
  </div>
  """

format_active: (elem, bg) ->
  elem.replace /^\s+|\s+$/g, ""
  if elem is ""
    return """ """
  else
    if elem[0] is "("
      elem = elem[1...-1]
      elem = """<span class="active">#{elem}</span>"""
    else
      elem = """<span class="inactive">#{elem}</span>"""
    return elem

style: """
  top: 14px
  left: 50px
  .active
    background-color: #f9e163
    color: #555
  span
    -webkit-font-smoothing: antialiased
    font: 11px Menlo
    display: inline;
    text-align: center
    padding-top: 7px
    padding-bottom: 5px
    padding-left: 9px
    padding-right: 8px
    color: #aaa
"""
