# -*- coding: utf-8 -*-
import xbmc

container_id = xbmc.getInfoLabel('System.CurrentControlID')
playlistid = 1 if xbmc.getCondVisibility('Player.HasVideo') else 0
playlist = xbmc.PlayList(playlistid)
current = playlist.getposition()
selected = xbmc.getInfoLabel('Container(%s).Position' % (container_id))
index = int(selected) - int(current)
xbmc.executebuiltin('Playlist.PlayOffset(%s)' % (index))
