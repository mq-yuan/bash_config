# ~/.config/fish/functions/update_all_tools.fish
function update_all_tools
    # 定义内部函数
    function print_header
        echo ""
        echo "============================"
        echo $argv
        echo "============================"
    end

    function update_homebrew
        print_header "正在更新 Homebrew"
        if type -q brew
            brew update
            echo "正在更新 homebrew packages"
            brew upgrade
        else
            echo "未安装 Homebrew，跳过更新。"
        end
    end

    function update_rust
        print_header "正在更新 Rustup"
        if type -q rustup
            rustup update
        else
            echo "未安装 Rustup，跳过更新。"
        end
    end

    function update_asdf
        print_header "正在更新 asdf 和插件"
        if type -q asdf
            asdf update
            asdf plugin update --all
        else
            echo "未安装 asdf，跳过更新。"
        end
    end

    function update_fish
        print_header "正在确认 Fish shell 更新"
        if type -q fish
            fish --version
            echo "Fish shell 通常通过包管理器（如 Homebrew）更新。"
        else
            echo "未检测到 Fish shell，跳过更新。"
        end
    end

    function update_fisher
        print_header "正在更新 Fisher 插件"
        if type -q fisher
            # 使用 status 检查而非 isatty，避免兼容性问题
            fisher update
        else
            echo "未安装 Fisher，跳过更新。"
        end
    end

    function update_conda
        print_header "正在更新 Conda"
        if type -q conda
            conda update -n base conda -y
        else
            echo "未安装 Conda，跳过更新。"
        end
    end

    # 定义工具列表和状态（使用局部变量而非全局变量）
    set -l tools "Homebrew (brew)" "Rust 和 Cargo (rustup, cargo)" "asdf 和插件" "Fish shell" "Fisher 插件" "Conda 和包"
    set -l tool_selected 0 0 0 0 0 0  # 0 表示未选中，1 表示选中

    function show_menu --no-scope-shadowing
        clear
        echo "MAC 命令行工具更新脚本"
        echo "========================================"
        echo "选择要更新的工具："
        echo ""
        
        for i in (seq (count $tools))
            set -l item_status "[ ]"
            if test $tool_selected[$i] -eq 1
                set item_status "[X]"
            end
            echo "$i) $item_status $tools[$i]"
        end
        
        echo ""
        echo "a) 全选"
        echo "c) 清除所有选择"
        echo "r) 运行更新"
        echo "q) 退出"
        echo ""
        echo -n "请输入选项: "
    end

    # 主程序循环
    while true
        show_menu
        read -l choice
        
        switch $choice
            case q
                echo "退出脚本"
                return 0  # 使用return而非exit
            case a
                # 全选
                for i in (seq (count $tools))
                    set tool_selected[$i] 1
                end
            case c
                # 清除所有选择
                for i in (seq (count $tools))
                    set tool_selected[$i] 0
                end
            case r
                # 运行更新
                set -l has_selection 0
                for i in (seq (count $tools))
                    if test $tool_selected[$i] -eq 1
                        set has_selection 1
                        switch $i
                            case 1
                                update_homebrew
                            case 2
                                update_rust
                            case 3
                                update_asdf
                            case 4
                                update_fish
                            case 5
                                update_fisher
                            case 6
                                update_conda
                        end
                    end
                end
                
                if test $has_selection -eq 0
                    echo "没有选择任何工具，请先选择要更新的工具。"
                    sleep 2
                else
                    echo ""
                    print_header "所有更新已完成！"
                    echo "按回车键返回菜单..."
                    read
                end
            case '*'
                # 检查是否为数字
                if string match -rq '^[0-9]+$' -- $choice
                    set -l idx (math $choice)
                    if test $idx -ge 1 -a $idx -le (count $tools)
                        # 切换选中状态
                        if test $tool_selected[$idx] -eq 0
                            set tool_selected[$idx] 1
                        else
                            set tool_selected[$idx] 0
                        end
                    else
                        echo "无效选项，请输入 1-"(count $tools)" 之间的数字。"
                        sleep 1
                    end
                else
                    echo "无效选项，请重试。"
                    sleep 1
                end
        end
    end
end
