#!/usr/bin/env coffee

import Koa from 'koa'
import koaBody from 'koa-body'
import { fileURLToPath } from "url"
import {join, dirname} from 'path'

__filename = fileURLToPath(`import.meta`.url)

KOA = new Koa()
KOA.use koaBody(
  multipart:true
)

wrap = (func)=>
  (ctx, next)=>
    try
      r = await func.call ctx
      if r == undefined
        r = ''
      ctx.body = r
    catch err
      ctx.status = 500
      ctx.body = err?.message or (err+"")
    next()

export default main = (port)=>
  console.log "http://127.0.0.1:#{port}"
  mod = await import('./plugin/aliwx')
  KOA.use wrap(mod.default)
  KOA.listen(port, "0.0.0.0")

import PORT from './config/port.txt'

if process.argv[1] == __filename
  main(process.env.PORT or PORT)
