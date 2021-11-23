# -*- coding: utf-8 -*-
import xbmc

playlistid = 1 if xbmc.getCondVisibility('Player.HasVideo') else 0
playlist = xbmc.PlayList(playlistid)
current = playlist.getposition()
selected = xbmc.getInfoLabel('ListItem.CurrentItem')
index = int(selected) - int(current) -1
xbmc.executebuiltin('Playlist.PlayOffset(%s)' % (index))

