module.exports =
  run: ->
    body = document.body

    triggerMeasurements = ->
      atom.workspace.increaseFontSize()
      atom.workspace.decreaseFontSize()

    applyFont = ->
      fonts = """
        --fonts-cjk-editorFont: "#{atom.config.get("fonts-cjk.editorFont")}";
        --fonts-cjk-markdownPreviewFont: "#{atom.config.get("fonts-cjk.markdownPreviewFont")}";
        --fonts-cjk-workspaceFont: "#{atom.config.get("fonts-cjk.workspaceFont")}";
      """
      body.setAttribute("style", fonts)
      triggerMeasurements()

    @observer = atom.config.observe("fonts-cjk.editorFont", -> applyFont())
    @observer = atom.config.observe("fonts-cjk.markdownPreviewFont", -> applyFont())
    @observer = atom.config.observe("fonts-cjk.workspaceFont", -> applyFont())

    setTimeout(triggerMeasurements, 500)

  stop: ->
    body = document.body
    body.removeAttribute("style")

    @observer?.dispose()
