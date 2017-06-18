module.exports =
  run: ->
    body = document.body

    triggerMeasurements = ->
      atom.workspace.increaseFontSize()
      atom.workspace.decreaseFontSize()

    setBodyAttribute = (attr, value, def = "(Default)") ->
      unless value == def
        body.setAttribute(attr, value)
      else
        body.removeAttribute(attr)

    applyFont = ->
      editorFont = atom.config.get("fonts-cjk.editorFont")
      markdownPreviewFont = atom.config.get("fonts-cjk.markdownPreviewFont")
      workspaceFont = atom.config.get("fonts-cjk.workspaceFont")
      fonts = """
        --fonts-cjk-editorFont: "#{editorFont}";
        --fonts-cjk-markdownPreviewFont: "#{markdownPreviewFont}";
        --fonts-cjk-workspaceFont: "#{workspaceFont}";
      """
      setBodyAttribute("style", fonts)
      setBodyAttribute("data-fonts-cjk-editorFont", editorFont)
      setBodyAttribute("data-fonts-cjk-markdownPreviewFont", markdownPreviewFont)
      setBodyAttribute("data-fonts-cjk-workspaceFont", workspaceFont)
      triggerMeasurements()

    @observer = atom.config.observe("fonts-cjk.editorFont", -> applyFont())
    @observer = atom.config.observe("fonts-cjk.markdownPreviewFont", -> applyFont())
    @observer = atom.config.observe("fonts-cjk.workspaceFont", -> applyFont())

    setTimeout(triggerMeasurements, 500)

  stop: ->
    body = document.body
    body.removeAttribute("data-fonts-cjk-editorFont")
    body.removeAttribute("data-fonts-cjk-markdownPreviewFont")
    body.removeAttribute("data-fonts-cjk-workspaceFont")
    body.removeAttribute("style")

    @observer?.dispose()
