#!/usr/bin/env coffee

import _TOKEN from '~/config/token.txt'
import Wxbot from '~/lib/wxbot'

TOKEN = do =>
  r = []
  for i from _TOKEN.split("\n")
    i = i.trim()
    if i and not i.startsWith("#")
      r.push i
  r

wxbot = Wxbot(TOKEN)

export default ->
  {body} = @request
  console.log body

  {
    alertName
    alertState
    expression
    instanceName
    lastTime
  } = body
  if not instanceName
    return
  
  d = {}
  for i from instanceName.split '，'
    pos = i.indexOf('=')
    d[i[...pos]] = i[pos+1..]

  if alertState == "OK"
    msg = """ 恢复正常 (故障持续了#{lastTime})"""
  else
    msg = """
#{alertName} #{alertState}

#{expression}
"""  

  await wxbot("""[#{d.address}](#{d.address})#{msg}""")
  return
