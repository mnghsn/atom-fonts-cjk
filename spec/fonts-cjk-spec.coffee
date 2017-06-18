fonts_cjk = require('../lib/fonts-cjk')

describe 'Fonts CJK', ->
  [workspaceElement] = []

  getFontFamily = (selector) ->
    element = if selector then workspaceElement.querySelector(selector) else workspaceElement
    return getComputedStyle(element).fontFamily.replace(/"(.+)"/, '$1')

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('fonts-cjk')
    waitsForPromise ->
      atom.workspace.open('file.txt')
    runs ->
      fonts_cjk.execute()
      workspaceElement = atom.views.getView(atom.workspace)
      jasmine.attachToDOM(workspaceElement)

  describe 'when editor font settings is changed', ->
    it 'set editor font', ->
      atom.config.set('fonts-cjk.editorFont', 'Migu 1M')
      expect(atom.config.get('fonts-cjk.editorFont'), 'Migu 1M')
      expect(getFontFamily('atom-text-editor.editor')).toBe('Migu 1M')

  describe 'when workspace font settings is changed', ->
    it 'set workspace font', ->
      atom.config.set('fonts-cjk.workspaceFont', 'Migu 1P')
      expect(atom.config.get('fonts-cjk.workspaceFont'), 'Migu 1P')
      expect(getFontFamily()).toBe('Migu 1P')

  describe 'when markdown preview font settings is changed', ->
    it 'set markdown preview font', ->
      waitsForPromise ->
        atom.packages.activatePackage('markdown-preview')
      runs ->
        atom.commands.dispatch(workspaceElement, 'markdown-preview:toggle')
      waitsFor 'markdown preview to be created', ->
        preview = atom.workspace.getPanes()[1].getActiveItem()
      runs ->
        atom.config.set('fonts-cjk.markdownPreviewFont', 'Migu 1P')
        expect(atom.config.get('fonts-cjk.markdownPreviewFont'), 'Migu 1P')
        expect(getFontFamily('.markdown-preview')).toBe('Migu 1P')
