package com.gsil.beitdev
import io.flutter.embedding.android.FlutterActivity
import android.app.PendingIntent
import android.content.Intent
import android.nfc.NfcAdapter

class MainActivity: FlutterActivity() {
    /// WORKAROUND TO DISABLE DEFAULT TAG DETECTION BY ANDROID SYSTEM WHILE THE APP IS ACTIVE
    override fun onResume() {
        super.onResume()
        val intent = Intent(context, javaClass).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)
        val pendingIntent = PendingIntent.getActivity(context, 0, intent, 0)
        NfcAdapter.getDefaultAdapter(context)?.enableForegroundDispatch(this, pendingIntent, null, null)
    }
    override fun onPause() {
        super.onPause()
        NfcAdapter.getDefaultAdapter(context)?.disableForegroundDispatch(this)
    }
    /// WORKAROUND END
}
