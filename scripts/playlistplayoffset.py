# -*- coding: utf-8 -*-
import xbmc

playlist = xbmc.PlayList(0)
current = playlist.getposition()
selected = xbmc.getInfoLabel('ListItem.CurrentItem')
index = int(selected) - int(current) -1
xbmc.executebuiltin('Playlist.PlayOffset(%s)' % (index))

