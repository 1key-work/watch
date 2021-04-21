#!/usr/bin/env coffee

import _TOKEN from '~/config/token.txt'
import Wxbot from '~/lib/wxbot'

TOKEN = do =>
  r = []
  for i from _TOKEN.split("\n")
    i = i.trim()
    if i
      r.push i
  r

wxbot = Wxbot(TOKEN)

export default ->
  {body} = @request
  console.log body

  {
    alertName
    expression
    instanceName
    lastTime
  } = body

  d = {}
  for i from instanceName.split '，'
    pos = i.indexOf('=')
    d[i[...pos]] = i[pos+1..]

  await wxbot("""[#{d.address}](#{d.address})

#{alertName} #{expression}

持续#{lastTime}
""")
  return
