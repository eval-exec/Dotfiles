#!/usr/bin/env bash
if [[ $(qdbus org.kde.kded5 /modules/touchpad isEnabled) == true ]];then
	qdbus org.kde.kded5 /modules/touchpad disable
else
	qdbus org.kde.kded5 /modules/touchpad enable
fi

