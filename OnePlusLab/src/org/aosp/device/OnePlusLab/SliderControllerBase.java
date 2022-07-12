/*
 * Copyright (C) 2018-2021 crDroid Android Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.aosp.device.OnePlusLab;

import android.content.Context;
import android.content.Intent;
import android.os.UserHandle;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.util.Log;

import org.aosp.device.OnePlusLab.Constants;

public abstract class SliderControllerBase {

    private static final String TAG = "SliderControllerBase";

    // Vibration effects
    private static final VibrationEffect MODE_NORMAL_EFFECT =
            VibrationEffect.get(VibrationEffect.EFFECT_HEAVY_CLICK);
    private static final VibrationEffect MODE_VIBRATION_EFFECT =
            VibrationEffect.get(VibrationEffect.EFFECT_DOUBLE_CLICK);


    protected final Context mContext;
    private final Vibrator mVibrator;

    private int[] mActions = null;

    public SliderControllerBase(Context context) {
        mContext = context;
        mVibrator = mContext.getSystemService(Vibrator.class);
    }

    public final void update(int[] actions) {
        if (actions != null && actions.length == 3) {
            mActions = actions;
        }
    }

    protected abstract int processAction(int action);

    public final int processEvent(Context context) {
        if (mActions == null) {
            return 0;
        }
 
        int state = Integer.parseInt(FileUtils.readOneLine(Constants.SLIDER_STATE));
        int result = processAction(mActions[state - 1]);
        if (result > 0) {
            switch (state) {
               case 1:
                   result = processAction(mActions[0]);
                   notifySliderChange(context, result, 0);
                   break;
               case 2:
                   result = processAction(mActions[1]);
                   notifySliderChange(context, result, 1);
                   doHapticFeedback(MODE_VIBRATION_EFFECT);
                   break;
               case 3:
                   result = processAction(mActions[2]);
                   notifySliderChange(context, result, 2);
                   doHapticFeedback(MODE_NORMAL_EFFECT);
                   break;    
            }
         }        
            return result;
    }

    private void notifySliderChange(Context context, int result, int position) {
        if (result > 0)
            sendUpdateBroadcast(context, position, result);
    }
    
    private void doHapticFeedback(VibrationEffect effect) {
        if (mVibrator != null && mVibrator.hasVibrator()) {
            mVibrator.vibrate(effect);
        }
    }

    public static void sendUpdateBroadcast(Context context, int position, int result) {
        Intent intent = new Intent(Constants.ACTION_UPDATE_SLIDER_POSITION);
        intent.putExtra(Constants.EXTRA_SLIDER_POSITION, position);
        intent.putExtra(Constants.EXTRA_SLIDER_POSITION_VALUE, result);
        context.sendBroadcastAsUser(intent, UserHandle.CURRENT);
        intent.setFlags(Intent.FLAG_RECEIVER_REGISTERED_ONLY);
        Log.d(TAG, "slider change to positon " + position);
    }

    public abstract void reset();

    public final void restoreState() {
        if (mActions == null) {
            return;
        }

        try {
            int state = Integer.parseInt(FileUtils.readOneLine(Constants.SLIDER_STATE));
            processAction(mActions[state - 1]);
        } catch (Exception e) {
            Log.e(TAG, "Failed to restore slider state", e);
        }
    }

    protected final <T> T getSystemService(String name) {
        return (T) mContext.getSystemService(name);
    }
}
