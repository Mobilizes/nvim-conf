return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  keys = {
    {
      "<leader>p",
      desc = "CompetiTest",
    },
    {
      "<leader>pR",
      ":CompetiTest receive problem<cr>",
      desc = "Receive problem",
    },
    {
      "<leader>pr",
      ":CompetiTest run<cr>",
      desc = "Run testcase",
    },
    {
      "<leader>pa",
      ":CompetiTest add_testcase<cr>",
      desc = "Add new testcase",
    },
    {
      "<leader>pe",
      ":CompetiTest edit_testcase<cr>",
      desc = "Edit testcase",
    },
    {
      "<leader>pd",
      ":CompetiTest delete_testcase<cr>",
      desc = "Delete testcase",
    },
    {
      "<leader>ps",
      ":CompetiTest show_ui<cr>",
      desc = "Show runner ui",
    },
  },
  desc = "CompetiTest",
  config = function()
    require("competitest").setup({
      evaluate_template_modifiers = true,
      compile_command = {
        cpp = { exec = "g++", args = { "-Wall", "$(FABSPATH)", "-o", "$(FNOEXT)" } },
        rust = { exec = "rustc", args = { "$(FABSPATH)" } },
      },
      run_command = {
        cpp = { exec = "./$(FNOEXT)" },
        rust = { exec = "./$(FNOEXT)" },
      },
      compile_directory = "../../executables/",
      running_directory = "../../executables/",
      testcases_directory = "testcases/",
      template_file = {
        cpp = "/home/mob/mob-env/templates/cp_template.cpp",
        rs = "/home/mob/mob-env/templates/cp_template.rs",
      },
      received_problems_path = function(task, file_extension)
        local hyphen = string.find(task.group, " - ")
        local judge, contest, name
        if not hyphen then
          judge = task.group
          contest = "unknown_contest"
        else
          judge = string.sub(task.group, 1, hyphen - 1)
          contest = string.sub(task.group, hyphen + 3)
        end
        if judge == "CSES" then
          name = task.name
          return string.format("%s/%s/%s.%s", vim.loop.cwd(), judge, name, file_extension)
        elseif judge == "Codeforces" then
          name = string.sub(task.name, 1, 1)
          if tonumber(string.sub(task.name, 2, 2)) ~= nil then
            name = string.sub(task.name, 1, 2)
          end
        end
        -- judge = judge:gsub("#", "")
        -- judge = judge:gsub(" ", "_")
        -- contest = contest:gsub("#", "")
        -- contest = contest:gsub(" ", "_")
        current_path = string.format("%s/%s/%s/%s.%s", vim.loop.cwd(), judge, contest, name, file_extension)
        return current_path
      end,
    })
  end,
}
