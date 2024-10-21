#!/bin/bash

DisplayPrompt()
{
    echo Compositor configuration tool
    echo "Please select your choice:";
    echo;

    options=("Enable compositor" "Disable compositor" "Exit")
    select opt in "${options[@]}"
    do
        case $opt in
            "Enable compositor") OptionStart; break;;
            "Disable compositor") OptionStop; break;;
            "Exit") break;;
            *) echo "invalid option '$REPLY'";;
        esac
    done
}
export -f DisplayPrompt

OptionStart()
{
    qdbus org.kde.KWin /Compositor resume;
    echo;
    echo Compositor has been: ENABLED;
}

OptionStop()
{
    qdbus org.kde.KWin /Compositor suspend;
    echo;
    echo Compositor has been: DISABLED;
}

DisplayPrompt;