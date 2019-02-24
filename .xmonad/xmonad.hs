import qualified Data.Map as M

import XMonad
import XMonad.Core
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.SpawnOnce

import System.IO

myStartupHook :: X ()
myStartupHook = do
  spawn "wal -R -n"
  spawn "stalonetray --dockapp-mode simple"
  spawn "feh --bg-scale ~/.xmonad/haskell.png"

newKeyBindings _ =
  [ ((0, 0x1008ff12), spawn "amixer sset Master 1+ toggle")
  , ((0, 0x1008ff11), spawn "amixer sset Master 10%-")
  , ((0, 0x1008ff13), spawn "amixer sset Master 10%+")
  , ((0, 0x1008ff03), spawn "light -U 10")
  , ((0, 0x1008ff02), spawn "light -A 10") ]

myKeys x = M.union (M.fromList (newKeyBindings x)) (keys defaultConfig x)

main = do
  xmonad $ defaultConfig
    { manageHook  = manageDocks <+> manageHook defaultConfig
    , layoutHook  = avoidStruts  $  layoutHook defaultConfig
    , modMask     = mod4Mask
    , terminal    = "urxvt"
    , keys        = myKeys
    , startupHook = myStartupHook
    }
