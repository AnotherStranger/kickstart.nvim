return {
  'huggingface/llm.nvim',

  opts = {
    -- cf Setup
    api_token = nil, -- cf Install paragraph
    model = 'qwen2.5-coder:1.5b-base', -- the model ID, behavior depends on backend
    backend = 'ollama', -- backend ID, "huggingface" | "ollama" | "openai" | "tgi"
    url = 'http://localhost:11434/api/generate', -- the http url of the backend
    --tokens_to_clear = { '<|fim_pad|>' }, --
    -- parameters that are added to the request body, values are arbitrary, you can set any field:value pair here it will be passed as is to the backend
    request_body = {
      options = {
        stop = { '<|endoftext|>', '<|fim_prefix|>', '<|fim_pad|>' },
        mirostat = 2,
        temperature = 0.2,
        top_k = 40,
        top_p = 0.95,
        num_ctx = 8192,
        min_p = 0.05,
        num_predict = 60,
      },
      keep_alive = 1800,
    },
    -- set this if the model supports fill in the middle
    fim = {
      enabled = true,
      prefix = '<|fim_prefix|>',
      middle = '<|fim_middle|>',
      suffix = '<|fim_suffix|>',
    },
    debounce_ms = 150,
    accept_keymap = '<C-y>',
    dismiss_keymap = '<C-n>',
    tls_skip_verify_insecure = false,
    -- llm-ls configuration, cf llm-ls section
    lsp = {
      bin_path = nil,
      host = nil,
      port = nil,
      cmd_env = nil, -- or { LLM_LOG_LEVEL = "DEBUG" } to set the log level of llm-ls
      version = '0.5.3',
    },
    tokenizer = {
      repository = 'Qwen/Qwen2.5-Coder-7B',
    },
    context_window = 8192, -- max number of tokens for the context window
    enable_suggestions_on_startup = true,
    enable_suggestions_on_files = '*', -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
    disable_url_path_completion = false, -- cf Backend
  },
}
