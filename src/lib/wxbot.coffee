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
    for url from li
      {data} = await axios.post(
        url
        post
      )
      {errcode} = data
      if errcode
        throw new Error(errcode+" : "+data.errmsg)
    return
