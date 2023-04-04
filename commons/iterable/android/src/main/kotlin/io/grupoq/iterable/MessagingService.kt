package io.grupoq.iterable
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage
import com.iterable.iterableapi.IterableFirebaseMessagingService

class MessagingService: FirebaseMessagingService() {
    override fun onMessageReceived(remoteMessage: RemoteMessage) {
        IterableFirebaseMessagingService.handleMessageReceived(this, remoteMessage)
    }

    override fun onNewToken(s: String) {
        IterableFirebaseMessagingService.handleTokenRefresh()
    }
}