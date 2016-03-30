package io.xdevs23.theme.bluemerald.cm.updater;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Icon;

import org.xdevs23.debugutils.Logging;
import org.xdevs23.debugutils.StackTraceParser;
import org.xdevs23.net.DownloadUtils;

import io.xdevs23.theme.bluemerald.cm.R;

public class CheckUpdateReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        try {
            UpdateActivity.UpdateType updateType = UpdateActivity.UpdateType.NONE;
            String latestVersionName = "";
            String latestVersionCodeString = DownloadUtils.downloadString(UpdaterStorage.URL_VERSION_CODE);
            int latestVersionCode = 0;
            if(!latestVersionCodeString.isEmpty()) latestVersionCode = Integer.parseInt(
                    latestVersionCodeString
            ); else Logging.logd("Version code was not downloaded correctly.");

            switch( Integer.parseInt(
                    String.valueOf(latestVersionCode)
                            .substring(8, 9)
            ) ) {
                case 0:case 1:case 2: updateType = UpdateActivity.UpdateType.RELEASE; break;
                case 3:case 4:case 5: updateType = UpdateActivity.UpdateType.BETA   ; break;
                case 6:case 7:        updateType = UpdateActivity.UpdateType.ALPHA  ; break;
                case 8:               updateType = UpdateActivity.UpdateType.NIGHTLY; break;
                case 9:               updateType = UpdateActivity.UpdateType.RELEASE; break;
                default:              updateType = UpdateActivity.UpdateType.NONE   ; break;
            }

            latestVersionName = DownloadUtils.downloadString(UpdaterStorage.URL_VERSION_NAME);

            if(latestVersionCode <= context.getPackageManager().getPackageInfo(context.getPackageName(), 0)
                    .versionCode) updateType = UpdateActivity.UpdateType.NONE;

            if(updateType != UpdateActivity.UpdateType.NONE) {
                NotificationManager nm = (NotificationManager) context
                        .getSystemService(Context.NOTIFICATION_SERVICE);
                Notification.Builder b = new Notification.Builder(context);
                Intent notificationIntent = new Intent(context, UpdateActivity.class);
                notificationIntent.putExtra("startUpdate", true);
                PendingIntent contentIntent = PendingIntent.getActivity(context,
                        0, notificationIntent,
                        PendingIntent.FLAG_CANCEL_CURRENT);
                b
                        .setContentIntent(contentIntent)
                        .setLargeIcon(BitmapFactory.decodeResource(context.getResources(), R.mipmap.m_app_icon))
                        .setSmallIcon(R.mipmap.m_app_icon)
                        .setContentTitle(context.getString(R.string.update_available_title))
                        .setContentText(context.getString(R.string.update_available_click_to_install))
                        .setAutoCancel(true)
                        ;


                Notification notif = b.getNotification();

                notif.defaults |= Notification.DEFAULT_ALL;
                nm.notify(0, notif);
            }
        } catch(Exception ex) {
            StackTraceParser.logStackTrace(ex);
        }
    }
}
