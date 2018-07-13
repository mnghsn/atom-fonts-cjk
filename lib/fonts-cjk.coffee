{CompositeDisposable} = require('atom')

module.exports =
  activate: ->
    @disposables = new CompositeDisposable
    @disposables.add(
      atom.config.observe('fonts-cjk.editorFont', (font) -> applyFont('editor-font', font)),
      atom.config.observe('fonts-cjk.markdownPreviewFont', (font) -> applyFont('markdown-preview-font', font)),
      atom.config.observe('fonts-cjk.workspaceFont', (font) -> applyFont('workspace-font', font)),
      atom.config.observe('fonts-cjk.secondaryFont', (font) -> applyFont('secondary-font', font))
    )
    setTimeout(triggerMeasurements, 500)

  deactivate: ->
    @disposables.dispose()
    applyFont('editor-font', '')
    applyFont('markdown-preview-font', '')
    applyFont('workspace-font', '')
    applyFont('secondary-font', '')

triggerMeasurements = ->
  atom.workspace.increaseFontSize()
  atom.workspace.decreaseFontSize()

applyFont = (type, font) ->
  unless font == '(Default)' or font == ''
    document.body.classList.add("fonts-cjk-#{type}")
    document.body.style.setProperty("--fonts-cjk-#{type}", "'#{font}'")
  else
    document.body.classList.remove("fonts-cjk-#{type}")
    document.body.style.removeProperty("--fonts-cjk-#{type}")
  triggerMeasurements()
