#!/usr/bin/env coffee

import TOKEN from '~/config/token.txt'
import Wxbot from '~/lib/wxbot'

wxbot = Wxbot(TOKEN)

export default ->
  {body} = @request
  console.log body
  {alertName, expression, instanceName} = body

  d = {}
  for i from instanceName.split '，'
    pos = i.indexOf('=')
    d[i[...pos]] = i[pos+1..]

  await wxbot("""[#{d.address}](#{d.address})

#{alertName} #{expression}
""")
  return
