{CompositeDisposable} = require('atom')

module.exports =
  run: ->
    @disposables = new CompositeDisposable
    @disposables.add(
      atom.config.observe('fonts-cjk.editorFont', (font) -> applyFont('editorFont', font)),
      atom.config.observe('fonts-cjk.markdownPreviewFont', (font) -> applyFont('markdownPreviewFont', font)),
      atom.config.observe('fonts-cjk.workspaceFont', (font) -> applyFont('workspaceFont', font))
    )
    setTimeout(triggerMeasurements, 500)

  stop: ->
    @disposables.dispose()
    applyFont('editorFont')
    applyFont('markdownPreviewFont')
    applyFont('workspaceFont')

triggerMeasurements = ->
  atom.workspace.increaseFontSize()
  atom.workspace.decreaseFontSize()

applyFont = (type, font) ->
  unless font == '(Default)' or font == null
    font = "'#{font}'"
    document.body.classList.add("fonts-cjk-#{type}")
    document.body.style.setProperty("--fonts-cjk-#{type}", font)
  else
    document.body.classList.remove("fonts-cjk-#{type}")
    document.body.style.removeProperty("--fonts-cjk-#{type}")
  triggerMeasurements()
