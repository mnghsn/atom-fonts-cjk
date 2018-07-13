fontsCJK = require('./fonts-cjk')

module.exports =
  activate: ->
    fontsCJK.run()

  deactivate: ->
    fontsCJK.stop()
