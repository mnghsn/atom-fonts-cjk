fontsCJK = require('./fonts-cjk')

module.exports =
  config:
    editorFont:
      type: 'string'
      title: 'Editor Font'
      description: 'Use one of the fonts available in this package.'
      order: 1
      default: '(Default)'
      enum: [
        '(Default)'
        'M+ 1m'
        'M+ 2m'
        'Ricty Diminished'
      ]
    markdownPreviewFont:
      type: 'string'
      title: 'Markdown Preview Font'
      description: 'Use one of the fonts available in this package.'
      order: 2
      default: '(Default)'
      enum: [
        '(Default)'
        'M+ 1p'
        'M+ 2p'
        'M+ 1m'
        'M+ 2m'
        'Noto Sans JP'
        'Noto Sans KR'
        'Noto Sans SC'
        'Noto Sans TC'
        'Ricty Diminished'
      ]
    workspaceFont:
      type: 'string'
      title: 'Workspace Font'
      description: 'Use one of the fonts available in this package.'
      order: 3
      default: '(Default)'
      enum: [
        '(Default)'
        'M+ 1p'
        'M+ 2p'
        'M+ 1m'
        'M+ 2m'
        'Noto Sans JP'
        'Noto Sans KR'
        'Noto Sans SC'
        'Noto Sans TC'
        'Ricty Diminished'
      ]
    secondaryFont:
      type: 'string'
      title: 'Secondary Font'
      description: 'Additional fonts for glyphs missing in the main font.'
      order: 4
      default: ''

  activate: ->
    fontsCJK.run()

  deactivate: ->
    fontsCJK.stop()
