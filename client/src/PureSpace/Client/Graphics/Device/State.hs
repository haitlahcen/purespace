-- State.hs ---

-- Copyright (C) 2018 Hussein Ait-Lahcen

-- Author: Hussein Ait-Lahcen <hussein.aitlahcen@gmail.com>

-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 3
-- of the License, or (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <http://www.gnu.org/licenses/>.

module PureSpace.Client.Graphics.Device.State
  (
    InputStream,
    DeviceState (..),
    HasDeviceState (..),
    initialDeviceState
  )
  where

import           PureSpace.Client.Graphics.Device.Input (InputStream)
import           PureSpace.Common.Lens                  (Lens', lens)

newtype DeviceState = DeviceState (Maybe InputStream)

class HasDeviceState s where
  deviceState      :: Lens' s DeviceState
  deviceInputState :: Lens' s (Maybe InputStream)
  deviceInputState = deviceState . deviceInputState

instance HasDeviceState DeviceState where
  deviceState = id
  deviceInputState =
    let f (DeviceState x)   = x
        g (DeviceState _) x = DeviceState x
    in lens f g

initialDeviceState :: DeviceState
initialDeviceState = DeviceState Nothing