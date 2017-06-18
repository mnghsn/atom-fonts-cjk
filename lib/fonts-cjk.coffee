module.exports =
  run: ->
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
      @observer = atom.config.observe("fonts-cjk.#{type}", -> applyFont(type))

    setTimeout(triggerMeasurements, 500)

  stop: ->
    body = document.body
    body.removeAttribute("data-fonts-cjk-editorFont")
    body.removeAttribute("data-fonts-cjk-markdownPreviewFont")
    body.removeAttribute("data-fonts-cjk-workspaceFont")

    @observer?.dispose()
