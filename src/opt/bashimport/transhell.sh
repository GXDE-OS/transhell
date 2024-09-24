#!/bin/bash

##load transhell
function load_transhell_debug()
{
local WORK_PATH="$(cd "$(dirname "${0}")"  && pwd)"
local CURRENT_LANG="$(echo ${LANG%.*})"
if [ -e "/usr/share/$(basename $0)/transhell/$(basename $0)_en_US.transhell" ]; then source /usr/share/$(basename $0)/transhell/$(basename $0)_en_US.transhell; echo "Loading transhell from /usr/share/$(basename $0)/transhell/$(basename $0)_en_US.transhell ..."; fi
if [ -e "/usr/share/$(basename $0)/transhell/$(basename $0)_$CURRENT_LANG.transhell" ]; then source /usr/share/$(basename $0)/transhell/$(basename $0)_$CURRENT_LANG.transhell; echo "Loading transhell from /usr/share/$(basename $0)/transhell/$(basename $0)_$CURRENT_LANG.transhell ..."; fi
if [ -e "${WORK_PATH}/transhell/$(basename $0)_en_US.transhell" ]; then source ${WORK_PATH}/transhell/$(basename $0)_en_US.transhell; echo "Loading transhell from ${WORK_PATH}/transhell/$(basename $0)_en_US.transhell ..."; fi
if [ -e "${WORK_PATH}/transhell/$(basename $0)_$CURRENT_LANG.transhell" ]; then source ${WORK_PATH}/transhell/$(basename $0)_$CURRENT_LANG.transhell; echo "Loading transhell from ${WORK_PATH}/transhell/$(basename $0)_$CURRENT_LANG.transhell ..."; fi

echo "-----------------------------------------------------------------------------"
}

function load_transhell()
{
local WORK_PATH="$(cd "$(dirname "${0}")"  && pwd)"
local CURRENT_LANG="$(echo ${LANG%.*})"
if [ -e "/usr/share/$(basename $0)/transhell/$(basename $0)_en_US.transhell" ]; then source /usr/share/$(basename $0)/transhell/$(basename $0)_en_US.transhell; fi
if [ -e "/usr/share/$(basename $0)/transhell/$(basename $0)_$CURRENT_LANG.transhell" ]; then source /usr/share/$(basename $0)/transhell/$(basename $0)_$CURRENT_LANG.transhell; fi
if [ -e "${WORK_PATH}/transhell/$(basename $0)_en_US.transhell" ]; then source ${WORK_PATH}/transhell/$(basename $0)_en_US.transhell; fi
if [ -e "${WORK_PATH}/transhell/$(basename $0)_$CURRENT_LANG.transhell" ]; then source ${WORK_PATH}/transhell/$(basename $0)_$CURRENT_LANG.transhell; fi

}

function update_transhell()
{
load_transhell $@
}

# transhell loader script
function transhell() {
    local str="$1"
    local uuid="transhell_$(echo -n "$str" | md5sum | awk '{print $1}')"
    local translated=$(eval echo \$\{"$uuid"\})

    if [ -z "$translated" ]; then
        echo "$str"  # Fallback to the original string if no translation is found
    else
        echo "$translated"
    fi
}

