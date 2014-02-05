# Recursive, case-insensitive grep => paginated, truncated display
function g () {
	grep -ir "$1" * | less -S
}

# Open shortcut
function o () {
   if [ -z "$1" ]
   then
     open .
   else
     open $@
   fi
}

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$@"
}

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh
	else
		local arg=-sh
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@"
	else
		du $arg .[^.]* *
	fi
}

# Create a data URL from a file
function dataurl() {
	local mimeType=$(file -b --mime-type "$1")
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8"
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
	if [ -t 0 ]; then # argument
		python -mjson.tool "$*" | pygmentize -l javascript
	else # pipe
		python -mjson.tool | pygmentize -l javascript
	fi
}

# Set Finder label color
function labelize() {
  if [ $# -lt 2 ]; then
    echo "USAGE: label [0-7] file1 [file2] ..."
    echo "Sets the Finder label (color) for files"
    echo "Default colors:"
    echo " 0  No color"
    echo " 1  Orange"
    echo " 2  Red"
    echo " 3  Yellow"
    echo " 4  Blue"
    echo " 5  Purple"
    echo " 6  Green"
    echo " 7  Gray"
  else
    osascript - "$@" << EOF
    on run argv
        set labelIndex to (item 1 of argv as number)
        repeat with i from 2 to (count of argv)
          tell application "Finder"
              set theFile to POSIX file (item i of argv) as alias
              set label index of theFile to labelIndex
          end tell
        end repeat
    end run
EOF
  fi
}

function b() {
	cd "$OX_UI_ROOT"
	python ox3-ui-core/build.py
}
