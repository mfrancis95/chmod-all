show_usage() {
    echo "Usage: chmod-all [OPTION] permissions directory"
    echo -e "Where OPTION is one of:\n"
    echo -e "  -d, --directories\tApply permissions to directories only."
    echo -e "  -f, --files\t\tApply permissions to files only."
}

if [ $# -eq 0 ]; then
    show_usage
    exit 1
else
    if [ "$1" == "-d" ] || [ "$1" == "--directories" ]; then
        if [ $# -lt 2 ]; then
            show_usage
            exit 1
        else
            find $3 -type d -exec chmod $2 {} \;
        fi
    elif [ "$1" == "-f" ] || [ "$1" == "--files" ]; then
        if [ $# -lt 2 ]; then
            show_usage
            exit 1
        else
            find $3 -type f -exec chmod $2 {} \;
        fi
    elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
        show_usage
    else
        chmod -R $1 $2
    fi
fi
