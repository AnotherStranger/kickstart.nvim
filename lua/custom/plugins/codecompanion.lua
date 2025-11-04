return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ravitemer/mcphub.nvim',
  },
  opts = {
    display = { action_palette = { provider = 'telescope' } },
    strategies = {
      chat = {
        adapter = 'ollama',
        model = 'qwen3-coder',
      },
      inline = {
        adapter = 'ollama',
        model = 'qwen3-coder',
      },
    },
    extensions = {
      mcphub = {
        callback = 'mcphub.extensions.codecompanion',
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = 'DEBUG',
    },
  },
}
