# -*- coding: utf-8 -*-
import xbmc
import xbmcgui

playlist = xbmc.PlayList(0)
playlist_id = 0
dbid = xbmc.getInfoLabel('listItem.dbid') if xbmc.getCondVisibility('!string.isempty(listitem.dbid)') else 0
dbtype = xbmc.getInfoLabel('listItem.dbtype') if xbmc.getCondVisibility('!string.isempty(listitem.dbtype)') else None
index = playlist.getposition() + 1
xbmc.executebuiltin('setproperty(playlist_updating,true,home)')
if int(dbid) > 0:
    if xbmc.getCondVisibility('!player.hasaudio'):
        playlist.clear()
        xbmc.executeJSONRPC('{"jsonrpc": "2.0", "id": 1, "method": "Player.Open", "params": {"item": {"%sid": %s} }}' % (dbtype,dbid))
    else:
        xbmc.executeJSONRPC('{"jsonrpc": "2.0", "id": 1, "method": "Playlist.Insert", "params": { "item": {"%sid": %s}, "playlistid": %s, "position": %s}}' % (dbtype,dbid,playlist_id,index))
        if xbmc.getCondVisibility('!skin.hassetting(%s_select_queue)' % dbtype):
            xbmc.executebuiltin('playlist.playoffset(1)')
xbmc.executebuiltin('clearproperty(playlist_updating,home)')



