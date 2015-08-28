# Description:
#   あなたのお友達がお返事してくれるAPI
#
# Commands:
#   <text>さーん - お返事API

module.exports = (robot) ->
  robot.hear /^(.+)さーん/, (msg) ->
    if !msg?.match[1]?
      return
    robot.http("http://oganity.pw/json/co8.json")
      .get() (err, res, body) ->
        if !err
          destName = msg?.match[1]
          for destUser in JSON.parse(body)?.destUsers
            if destUser?.name is destName
              msg.send "@#{msg.random destUser?.icons}＜#{msg.random destUser?.messages}"
              break
