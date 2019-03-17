'use babel'

describe('set cjk fonts', () => {
  let textEditorElement
  let workspaceElement

  const getFontFamily = (selector, nth = 1) => {
    const element = selector ? workspaceElement.querySelector(selector) : workspaceElement
    const fonts = getComputedStyle(element).fontFamily.split(',')
    return fonts[nth - 1].trim().replace(/"(.+)"/, '$1')
  }

  beforeEach(() => {
    waitsForPromise(() => atom.packages.activatePackage('fonts-cjk'))
    waitsForPromise(() => atom.workspace.open())
    runs(() => {
      textEditorElement = atom.workspace.getActiveTextEditor().getElement()
      workspaceElement = atom.views.getView(atom.workspace)
      jasmine.attachToDOM(workspaceElement)
    })
  })

  afterEach(() => {
    runs(() => {
      workspaceElement.remove()
    })
  })

  describe('when editor font settings is changed', () => {
    it('set editor font', () => {
      atom.config.set('fonts-cjk.editorFont', 'M+ 1m')
      expect(atom.config.get('fonts-cjk.editorFont')).toBe('M+ 1m')
      expect(getFontFamily('atom-text-editor.editor')).toBe('M+ 1m')
    })
  })

  describe('when workspace font settings is changed', () => {
    it('set workspace font', () => {
      atom.config.set('fonts-cjk.workspaceFont', 'M+ 1p')
      expect(atom.config.get('fonts-cjk.workspaceFont')).toBe('M+ 1p')
      expect(getFontFamily()).toBe('M+ 1p')
    })
  })

  describe('when markdown preview font settings is changed', () => {
    it('set markdown preview font', () => {
      waitsForPromise(() => atom.packages.activatePackage('markdown-preview'))
      runs(() => atom.commands.dispatch(textEditorElement, 'markdown-preview:toggle'))
      waitsFor(() => atom.workspace.getPanes()[1].getActiveItem())
      runs(() => {
        atom.config.set('fonts-cjk.markdownPreviewFont', 'M+ 1p')
        expect(atom.config.get('fonts-cjk.markdownPreviewFont')).toBe('M+ 1p')
        expect(getFontFamily('.markdown-preview')).toBe('M+ 1p')
      })
    })
  })

  describe('when secondary font settings is changed', () => {
    it('set secondary font', () => {
      atom.config.set('fonts-cjk.editorFont', 'M+ 1m')
      atom.config.set('fonts-cjk.secondaryFont', 'Droid Sans Mono')
      expect(atom.config.get('fonts-cjk.editorFont')).toBe('M+ 1m')
      expect(atom.config.get('fonts-cjk.secondaryFont')).toBe('Droid Sans Mono')
      expect(getFontFamily('atom-text-editor.editor', 2)).toBe('Droid Sans Mono')
    })
  })
})
