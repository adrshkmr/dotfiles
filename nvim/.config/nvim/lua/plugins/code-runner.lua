return {
    "CRAG666/code_runner.nvim",
    dependencies = {
        "akinsho/toggleterm.nvim",
    },
    event = "BufReadPost",
    config = function()
        require("code_runner").setup({
            mode = "toggleterm",
            focus = true,
            startinsert = true,

            before_run_filetype = function()
                vim.cmd("write")
            end,

            filetype = {
                java = function()
                    local current_file = vim.fn.expand("%:t")
                    local file_name_without_ext = vim.fn.expand("%:t:r")
                    local dir = vim.fn.expand("%:p:h")

                    local function has_file(filename)
                        return vim.fn.filereadable(filename) == 1
                    end

                    local function find_main_class()
                        local file_content = vim.fn.readfile(vim.fn.expand("%:p"))
                        for _, line in ipairs(file_content) do
                            if
                                line:match("public%s+class%s+([%w_]+)")
                                and vim.fn.search("public%s+static%s+void%s+main", "n") > 0
                            then
                                return line:match("public%s+class%s+([%w_]+)")
                            end
                        end
                        return file_name_without_ext
                    end

                    require("code_runner.hooks.ui").select({
                        ["Simple Run"] = function()
                            local main_class = find_main_class()
                            local cmd = string.format(
                                "cd %s && javac %s && java %s",
                                vim.fn.shellescape(dir),
                                vim.fn.shellescape(current_file),
                                main_class
                            )
                            require("code_runner.commands").run_from_fn({ cmd })
                        end,

                        ["Run with Args"] = function()
                            vim.ui.input({ prompt = "Java args: " }, function(args)
                                if args then
                                    local main_class = find_main_class()
                                    local cmd = string.format(
                                        "cd %s && javac %s && java %s %s",
                                        vim.fn.shellescape(dir),
                                        vim.fn.shellescape(current_file),
                                        main_class,
                                        args
                                    )
                                    require("code_runner.commands").run_from_fn({ cmd })
                                end
                            end)
                        end,

                        ["Maven Run"] = function()
                            if has_file("pom.xml") then
                                require("code_runner.commands").run_from_fn({ "mvn compile exec:java" })
                            else
                                vim.notify("No pom.xml found!", vim.log.levels.WARN)
                            end
                        end,

                        ["Maven Test"] = function()
                            if has_file("pom.xml") then
                                require("code_runner.commands").run_from_fn({ "mvn test" })
                            else
                                vim.notify("No pom.xml found!", vim.log.levels.WARN)
                            end
                        end,

                        ["Gradle Run"] = function()
                            if has_file("build.gradle") or has_file("build.gradle.kts") then
                                require("code_runner.commands").run_from_fn({ "gradle run" })
                            else
                                vim.notify("No build.gradle found!", vim.log.levels.WARN)
                            end
                        end,

                        ["Gradle Test"] = function()
                            if has_file("build.gradle") or has_file("build.gradle.kts") then
                                require("code_runner.commands").run_from_fn({ "gradle test" })
                            else
                                vim.notify("No build.gradle found!", vim.log.levels.WARN)
                            end
                        end,

                        ["Spring Boot"] = function()
                            if
                                has_file("src/main/resources/application.properties")
                                or has_file("src/main/resources/application.yml")
                            then
                                if has_file("pom.xml") then
                                    require("code_runner.commands").run_from_fn({ "mvn spring-boot:run" })
                                elseif has_file("build.gradle") then
                                    require("code_runner.commands").run_from_fn({ "gradle bootRun" })
                                end
                            else
                                vim.notify("Not a Spring Boot project!", vim.log.levels.WARN)
                            end
                        end,

                        ["Create JAR"] = function()
                            vim.ui.input({ prompt = "JAR name (without .jar): " }, function(jar_name)
                                if jar_name then
                                    local main_class = find_main_class()
                                    local cmd = string.format(
                                        "cd %s && javac %s && jar cfe %s.jar %s *.class",
                                        vim.fn.shellescape(dir),
                                        vim.fn.shellescape(current_file),
                                        jar_name,
                                        main_class
                                    )
                                    require("code_runner.commands").run_from_fn({ cmd })
                                end
                            end)
                        end,
                    })
                end,

                python = "cd $dir && python3 -u $fileName",
                py = "cd $dir && python3 -u $fileName",
                javascript = "node $fileName",
                js = "node $fileName",
                typescript = "npx ts-node $fileName",
                ts = "npx ts-node $fileName",

                c = function()
                    require("code_runner.hooks.ui").select({
                        ["Simple"] = function()
                            require("code_runner.commands").run_from_fn({
                                "cd $dir &&",
                                "gcc -Wall -Wextra -std=c11 $fileName -o $fileNameWithoutExt &&",
                                "./$fileNameWithoutExt",
                            })
                        end,
                        ["With Input"] = function()
                            vim.ui.input({ prompt = "Input file (optional): " }, function(input_file)
                                local cmd = {
                                    "cd $dir &&",
                                    "gcc -Wall -Wextra -std=c11 $fileName -o $fileNameWithoutExt &&",
                                }
                                if input_file and input_file ~= "" then
                                    table.insert(cmd, "./$fileNameWithoutExt < " .. input_file)
                                else
                                    table.insert(cmd, "./$fileNameWithoutExt")
                                end
                                require("code_runner.commands").run_from_fn(cmd)
                            end)
                        end,
                    })
                end,

                cpp = function()
                    require("code_runner.hooks.ui").select({
                        ["Simple"] = function()
                            require("code_runner.commands").run_from_fn({
                                "cd $dir &&",
                                "g++ -Wall -Wextra -std=c++17 $fileName -o $fileNameWithoutExt &&",
                                "./$fileNameWithoutExt",
                            })
                        end,
                        ["Competitive"] = function()
                            require("code_runner.commands").run_from_fn({
                                "cd $dir &&",
                                "g++ -std=c++17 -Wall -O2 -DLOCAL $fileName -o $fileNameWithoutExt &&",
                                "./$fileNameWithoutExt",
                            })
                        end,
                        ["With Input"] = function()
                            vim.ui.input({ prompt = "Input file (optional): " }, function(input_file)
                                local cmd = {
                                    "cd $dir &&",
                                    "g++ -std=c++17 -Wall -O2 $fileName -o $fileNameWithoutExt &&",
                                }
                                if input_file and input_file ~= "" then
                                    table.insert(cmd, "./$fileNameWithoutExt < " .. input_file)
                                else
                                    table.insert(cmd, "./$fileNameWithoutExt")
                                end
                                require("code_runner.commands").run_from_fn(cmd)
                            end)
                        end,
                    })
                end,

                go = "go run $fileName",
                rust = function()
                    local cwd = vim.fn.getcwd()
                    if vim.fn.filereadable(cwd .. "/Cargo.toml") == 1 then
                        require("code_runner.commands").run_from_fn({ "cargo run" })
                    else
                        require("code_runner.commands").run_from_fn({
                            "cd $dir &&",
                            "rustc $fileName -o $fileNameWithoutExt &&",
                            "./$fileNameWithoutExt",
                        })
                    end
                end,

                lua = "lua $file",
                sh = "bash $fileName",
                bash = "bash $fileName",
                zsh = "zsh $fileName",
                ruby = "ruby $fileName",
                rb = "ruby $fileName",
                php = "php $fileName",
                perl = "perl $fileName",
                pl = "perl $fileName",
                r = "Rscript $fileName",
                swift = "swift $fileName",
                dart = "dart run $fileName",
                kotlin =
                "kotlinc $fileName -include-runtime -d $fileNameWithoutExt.jar && java -jar $fileNameWithoutExt.jar",
                kt = "kotlinc $fileName -include-runtime -d $fileNameWithoutExt.jar && java -jar $fileNameWithoutExt.jar",
                scala = "scala $fileName",
                groovy = "groovy $fileName",

                json = "cat $fileName | jq .",
                html = "xdg-open $fileName || open $fileName",

                markdown = function()
                    require("code_runner.hooks.ui").select({
                        ["Preview"] = function()
                            require("code_runner.commands").run_from_fn({
                                "command -v glow >/dev/null 2>&1 && glow $fileName || cat $fileName",
                            })
                        end,
                        ["To HTML"] = function()
                            require("code_runner.commands").run_from_fn({
                                "pandoc $fileName -o $fileNameWithoutExt.html && xdg-open $fileNameWithoutExt.html",
                            })
                        end,
                    })
                end,
                md = function()
                    require("code_runner.hooks.ui").select({
                        ["Preview"] = function()
                            require("code_runner.commands").run_from_fn({
                                "command -v glow >/dev/null 2>&1 && glow $fileName || cat $fileName",
                            })
                        end,
                        ["To HTML"] = function()
                            require("code_runner.commands").run_from_fn({
                                "pandoc $fileName -o $fileNameWithoutExt.html && xdg-open $fileNameWithoutExt.html",
                            })
                        end,
                    })
                end,
            },
        })
    end,

    keys = {
        { "<leader>cr", ":RunCode<CR>",    desc = "Run Code",     mode = "n", silent = true },
        { "<leader>cc", ":RunFile<CR>",    desc = "Quick Run",    mode = "n", silent = true },
        { "<leader>cp", ":RunProject<CR>", desc = "Run Project",  mode = "n", silent = true },
        { "<leader>ct", ":RunClose<CR>",   desc = "Close Runner", mode = "n", silent = true },
    },
}
