#!/bin/bash

# 显示帮助信息
function show_help() {
    echo "用法: $0 [选项]..."
    echo "将 transhell 文件中的文本恢复到源程序的文本中。"
    echo
    echo "选项："
    echo "  -t, --transhell <文件>  指定 transhell 文件的位置"
    echo "  -s, --source <文件>     指定源程序文件的位置"
    echo "  -h, --help              显示帮助信息"
    echo
    echo "示例："
    echo "  $0 -t transhell -s source_code.sh"
    echo "  $0 --transhell=transhell --source=source_code.sh"
    echo
    echo "请确保指定的文件存在，并且 transhell 文件中的变量名与源文件中的变量名一致。"
}

# 解析命令行参数
while [[ $# -gt 0 ]]; do
    case "$1" in
        -t|--transhell)
            shift
            transhell_file=$1
            shift
            ;;
        -s|--source)
            shift
            source_file=$1
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            echo "无效的参数: $1"
            show_help
            exit 1
            ;;
    esac
done

# 检查是否指定了 transhell 文件和源文件
if [ -z "$transhell_file" ] || [ -z "$source_file" ]; then
    show_help
    exit 1
fi

# 检查 transhell 文件是否存在
if [ ! -f "$transhell_file" ]; then
    echo "transhell 文件 '$transhell_file' 不存在"
    exit 1
fi

# 读取 transhell 文件中的内容
transhell_content=$(cat "$transhell_file")

# 提取 transhell 文件中以 TRANSHELL_CONTENT 开头的变量值
re='^TRANSHELL_CONTENT_.*'
while IFS= read -r line; do
    if [[ $line =~ $re ]]; then
        var_name=$(echo "$line" | awk -F '=' '{print $1}')
        var_value=$(echo "$line" | awk -F '=' '{print $2}')
        eval "$var_name=\"$var_value\""
    fi
done <<< "$transhell_content"

# 替换源程序中以 TRANSHELL_CONTENT 开头的变量为对应的值
if [ ! -f "$source_file" ]; then
    echo "源程序文件 '$source_file' 不存在"
    exit 1
fi

while IFS= read -r line; do
    if [[ $line =~ $re ]]; then
        var_name=$(echo "$line" | awk -F ':' '{print $1}' | tr -d '[:blank:]')
        var_value=$(eval "echo \"\$$var_name\"")
        line=$(echo "$line" | awk -F ':' -v var="$var_value" '{print var}')
    fi
    echo "$line"
done < "$source_file"
