module.exports =
  run: ->
    @body = document.body
    @style = document.createElement('style')

    triggerMeasurements = ->
      atom.workspace.increaseFontSize()
      atom.workspace.decreaseFontSize()

    setBodyAttribute = (attr, value) =>
      unless value == '(Default)'
        @body.setAttribute(attr, value)
      else
        @body.removeAttribute(attr)

    applyFont = =>
      editorFont = atom.config.get('fonts-cjk.editorFont')
      markdownPreviewFont = atom.config.get('fonts-cjk.markdownPreviewFont')
      workspaceFont = atom.config.get('fonts-cjk.workspaceFont')
      @style.textContent = """
        :root {
          --fonts-cjk-editorFont: "#{editorFont}";
          --fonts-cjk-markdownPreviewFont: "#{markdownPreviewFont}";
          --fonts-cjk-workspaceFont: "#{workspaceFont}";
        }
      """

      setBodyAttribute('data-fonts-cjk-editorFont', editorFont)
      setBodyAttribute('data-fonts-cjk-markdownPreviewFont', markdownPreviewFont)
      setBodyAttribute('data-fonts-cjk-workspaceFont', workspaceFont)
      triggerMeasurements()

    document.head.appendChild(@style)

    @observer = atom.config.observe('fonts-cjk.editorFont', -> applyFont())
    @observer = atom.config.observe('fonts-cjk.markdownPreviewFont', -> applyFont())
    @observer = atom.config.observe('fonts-cjk.workspaceFont', -> applyFont())

    setTimeout(triggerMeasurements, 500)

  stop: ->
    @body.removeAttribute('data-fonts-cjk-editorFont')
    @body.removeAttribute('data-fonts-cjk-markdownPreviewFont')
    @body.removeAttribute('data-fonts-cjk-workspaceFont')
    @style.parentNode.removeChild(@style)

    @observer?.dispose()
