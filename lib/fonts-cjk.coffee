module.exports =
  execute: ->
    body = document.body

    triggerMeasurements = ->
      atom.workspace.increaseFontSize()
      atom.workspace.decreaseFontSize()

    applyFont = (type) ->
      body.setAttribute(
        "data-fonts-cjk-#{type}"
        atom.config.get("fonts-cjk.#{type}")
      )
      triggerMeasurements()

    [
      'editorFont'
      'markdownPreviewFont'
      'workspaceFont'
    ].forEach (type) ->
      applyFont(type)
      atom.config.observe("fonts-cjk.#{type}", -> applyFont(type))

    setTimeout(triggerMeasurements, 500)
