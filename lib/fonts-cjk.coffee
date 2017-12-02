{CompositeDisposable} = require('atom')

module.exports =
  run: ->
    @body = document.body
    @style = document.body.style
    @disposables = new CompositeDisposable

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
      @style.setProperty('--fonts-cjk-editorFont', "'#{editorFont}'")
      @style.setProperty('--fonts-cjk-markdownPreviewFont', "'#{markdownPreviewFont}'")
      @style.setProperty('--fonts-cjk-workspaceFont', "'#{workspaceFont}'")
      setBodyAttribute('data-fonts-cjk-editorFont', editorFont)
      setBodyAttribute('data-fonts-cjk-markdownPreviewFont', markdownPreviewFont)
      setBodyAttribute('data-fonts-cjk-workspaceFont', workspaceFont)
      triggerMeasurements()

    @disposables.add(atom.config.observe('fonts-cjk.editorFont', applyFont))
    @disposables.add(atom.config.observe('fonts-cjk.markdownPreviewFont', applyFont))
    @disposables.add(atom.config.observe('fonts-cjk.workspaceFont', applyFont))
    setTimeout(triggerMeasurements, 500)

  stop: ->
    @body.removeAttribute('data-fonts-cjk-editorFont')
    @body.removeAttribute('data-fonts-cjk-markdownPreviewFont')
    @body.removeAttribute('data-fonts-cjk-workspaceFont')
    @style.removeProperty('--fonts-cjk-editorFont')
    @style.removeProperty('--fonts-cjk-markdownPreviewFont')
    @style.removeProperty('--fonts-cjk-workspaceFont')
    @disposables.dispose()
