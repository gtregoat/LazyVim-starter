return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make",
  opts = {
    -- Use Claude via ACP agent (Claude Code)
    provider = "claude-code",
    mode = "agentic",

    -- Use Anthropic Claude for auto suggestions and planning
    auto_suggestions_provider = "claude",
    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        -- Recommended stable model from Avante README
        model = "claude-sonnet-4-5-20250929",
        timeout = 30000,
        api_key_name = "AVANTE_ANTHROPIC_API_KEY",
        extra_request_body = {
          temperature = 0.7,
        },
      },
    },

    -- ACP provider configuration for Claude Code
    acp_providers = {
      ["claude-code"] = {
        command = "npx",
        args = { "@zed-industries/claude-code-acp" },
        env = {
          NODE_NO_WARNINGS = "1",
          ANTHROPIC_API_KEY = os.getenv("ANTHROPIC_API_KEY") or os.getenv("AVANTE_ANTHROPIC_API_KEY"),
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- Core dependencies only for stability
    "nvim-tree/nvim-web-devicons",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
