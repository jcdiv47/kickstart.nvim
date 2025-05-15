return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  version = '1.*',
  opts = {
    -- Custom port to open the preview server. Default is random.
    port = 0,
    dependencies_bin = { ['tinymist'] = 'tinymist' },
  }, -- lazy.nvim will implicitly calls `setup {}`
}
