{CompositeDisposable} = require('atom')

module.exports =
  run: ->
    @classList = document.body.classList
    @style = document.body.style
    @disposables = new CompositeDisposable

    triggerMeasurements = ->
      atom.workspace.increaseFontSize()
      atom.workspace.decreaseFontSize()

    setBodyClass = (attr, value) =>
      unless value == '(Default)'
        @classList.add("fonts-cjk-#{attr}")
      else
        @classList.remove("fonts-cjk-#{attr}")

    applyFont = =>
      editorFont = atom.config.get('fonts-cjk.editorFont')
      markdownPreviewFont = atom.config.get('fonts-cjk.markdownPreviewFont')
      workspaceFont = atom.config.get('fonts-cjk.workspaceFont')
      @style.setProperty('--fonts-cjk-editorFont', "'#{editorFont}'")
      @style.setProperty('--fonts-cjk-markdownPreviewFont', "'#{markdownPreviewFont}'")
      @style.setProperty('--fonts-cjk-workspaceFont', "'#{workspaceFont}'")
      setBodyClass('editorFont', editorFont)
      setBodyClass('markdownPreviewFont', markdownPreviewFont)
      setBodyClass('workspaceFont', workspaceFont)
      triggerMeasurements()

    @disposables.add(atom.config.observe('fonts-cjk.editorFont', applyFont))
    @disposables.add(atom.config.observe('fonts-cjk.markdownPreviewFont', applyFont))
    @disposables.add(atom.config.observe('fonts-cjk.workspaceFont', applyFont))
    setTimeout(triggerMeasurements, 500)

  stop: ->
    @classList.remove('fonts-cjk-editorFont')
    @classList.remove('fonts-cjk-markdownPreviewFont')
    @classList.remove('fonts-cjk-workspaceFont')
    @style.removeProperty('--fonts-cjk-editorFont')
    @style.removeProperty('--fonts-cjk-markdownPreviewFont')
    @style.removeProperty('--fonts-cjk-workspaceFont')
    @disposables.dispose()
