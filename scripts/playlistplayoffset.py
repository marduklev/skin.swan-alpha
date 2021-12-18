# -*- coding: utf-8 -*-
import xbmc

container_id = xbmc.getInfoLabel('system.currentcontrolid')
playlistid = 1 if xbmc.getCondVisibility('player.hasvideo') else 0
playlist = xbmc.PlayList(playlistid)
current = playlist.getposition()
selected = int(xbmc.getInfoLabel('container(%s).currentitem' % container_id)) - 1
index = int(selected) - int(current)
xbmc.executebuiltin('playlist.playoffset(%s)' % (index))
