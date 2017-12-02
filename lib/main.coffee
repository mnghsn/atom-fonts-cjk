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
        'MigMix 1M'
        'MigMix 2M'
        'Migu 1M'
        'Migu 2M'
        'Ricty Diminished'
        'Source Han Code JP'
      ]
    markdownPreviewFont:
      type: 'string'
      title: 'Markdown Preview Font'
      description: 'Use one of the fonts available in this package.'
      order: 2
      default: '(Default)'
      enum: [
        '(Default)'
        'MigMix 1P'
        'MigMix 2P'
        'MigMix 1M'
        'MigMix 2M'
        'Migu 1P'
        'Migu 1C'
        'Migu 1M'
        'Migu 2M'
        'Ricty Diminished'
        'Source Han Code JP'
        'Source Han Sans JP'
        'Source Han Sans KR'
        'Source Han Sans TW'
        'Source Han Sans CN'
      ]
    workspaceFont:
      type: 'string'
      title: 'Workspace Font'
      description: 'Use one of the fonts available in this package.'
      order: 3
      default: '(Default)'
      enum: [
        '(Default)'
        'MigMix 1P'
        'MigMix 2P'
        'MigMix 1M'
        'MigMix 2M'
        'Migu 1P'
        'Migu 1C'
        'Migu 1M'
        'Migu 2M'
        'Ricty Diminished'
        'Source Han Code JP'
        'Source Han Sans JP'
        'Source Han Sans KR'
        'Source Han Sans TW'
        'Source Han Sans CN'
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
