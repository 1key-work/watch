#!/usr/bin/env coffee

import axios from '@rmw/axios'


export default (token, msgtype="markdown")=>
  li = []
  for i from token
    li.push "https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=#{i}"
  (content)=>
    post = {
      msgtype
    }
    post[msgtype] = {
      content
    }
    todo = []
    for url from li
      todo.push axios.post(
        url
        post
      )
    for data from await Promise.all(todo)
      {errcode} = data
      if errcode
        throw new Error(errcode+" : "+data.errmsg)
    return
