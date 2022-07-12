/*
* Copyright (C) 2016 The OmniROM Project
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*
*/
package org.aosp.device.OnePlusLab;

import android.content.Context;
import android.content.SharedPreferences;
import androidx.preference.Preference;
import androidx.preference.Preference.OnPreferenceChangeListener;

import org.aosp.device.OnePlusLab.FileUtils;

public class GameModeSwitch implements OnPreferenceChangeListener {

    private static final String FILE = "/proc/touchpanel/game_switch_enable";

    public static String getFile() {
        if (FileUtils.fileWritable(FILE)) {
            return FILE;
        }
        return null;
    }

    public static boolean isSupported() {
        return FileUtils.fileWritable(getFile());
    }

    public static boolean isCurrentlyEnabled(Context context) {
        return FileUtils.getFileValueAsBoolean(getFile(), false, "1, smooth_level:0, sensitive_level:0, high_frame_support:0, high_frame_value:0", "0, smooth_level:0, sensitive_level:0, high_frame_support:0, high_frame_value:0");
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        Boolean enabled = (Boolean) newValue;
        FileUtils.writeValue(getFile(), enabled ? "1" : "0");
        return true;
    }
}
