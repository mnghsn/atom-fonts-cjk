'use babel'

import { CompositeDisposable } from 'atom'

export default {
  disposables: null,

  activate (state) {
    this.disposables = new CompositeDisposable()
    this.disposables.add(
      atom.config.observe('fonts-cjk.editorFont', (font) => applyFont('editor-font', font)),
      atom.config.observe('fonts-cjk.markdownPreviewFont', (font) => applyFont('markdown-preview-font', font)),
      atom.config.observe('fonts-cjk.workspaceFont', (font) => applyFont('workspace-font', font)),
      atom.config.observe('fonts-cjk.secondaryFont', (font) => applyFont('secondary-font', font))
    )
    setTimeout(triggerMeasurements, 500)
  },

  deactivate (state) {
    this.disposables.dispose()
    applyFont('editor-font')
    applyFont('markdown-preview-font')
    applyFont('workspace-font')
    applyFont('secondary-font')
  }
}

function applyFont (type, font) {
  if (font === '(Default)' || font === null) {
    document.body.classList.remove(`fonts-cjk-${type}`)
    document.body.style.removeProperty(`--fonts-cjk-${type}`)
  } else {
    document.body.classList.add(`fonts-cjk-${type}`)
    document.body.style.setProperty(`--fonts-cjk-${type}`, `"${font}"`)
  }
}

function triggerMeasurements () {
  atom.workspace.increaseFontSize()
  atom.workspace.decreaseFontSize()
}
