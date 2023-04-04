package io.grupoq.iterable

import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull
import com.iterable.iterableapi.IterableApi
import com.iterable.iterableapi.IterableAuthHandler
import com.iterable.iterableapi.IterableConfig
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry


/** IterablePlugin */
class IterablePlugin: FlutterPlugin, MethodCallHandler, PluginRegistry.NewIntentListener {
    private val CHANNEL_NAME: String = "grupoq.io/iterable"
    private val METHOD_NAME_INIT_SECRETS = "initSecrets"
    private val METHOD_NAME_INITIALIZE: String = "initialize"
    private val METHOD_NAME_CONFIGURE: String = "configure"
    private val METHOD_NAME_DISABLE: String = "disable"
    private val PARAM_NAME_API_KEY: String = "apiKey"
    private val PARAM_NAME_EMAIL: String = "email"

    private val activeLogDebug = false
    private var apiKey = ""

    private lateinit var channel : MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext

        channel = MethodChannel(flutterPluginBinding.binaryMessenger, CHANNEL_NAME)
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            METHOD_NAME_INIT_SECRETS -> {
                initSecrets(call.arguments, result)
            }
            METHOD_NAME_INITIALIZE -> {
                initialize(context, result)
            }
            METHOD_NAME_CONFIGURE -> {
                configureIterable(call.arguments, result)
            }
            METHOD_NAME_DISABLE -> {
                disablePush(result)
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun initSecrets(arguments: Any, result: Result) {
        val map = arguments as? HashMap<*, *>
        val apiKeyParam = map?.get(PARAM_NAME_API_KEY) as? String
        apiKeyParam?.let { key ->
            apiKey = key
        } ?: run {
            result.error("error","invalid api key", null)
        }
    }

    private fun initialize(context: Context?, result: Result?) {
        context?.let { context ->
        val configBuilder = IterableConfig.Builder()
            .setAutoPushRegistration(false)
            .setCustomActionHandler { _, _ ->
                false
            }

            if (activeLogDebug) {
                configBuilder.setLogLevel(Log.DEBUG)
            }

            IterableApi.initialize(context, apiKey, configBuilder.build())
            result?.success(null)
        } ?: run {
            result?.error("error","invalid context", null)
        }
    }

    private fun configureIterable(arguments: Any, result: Result) {
        val map = arguments as? HashMap<*, *>
        val email = map?.get(PARAM_NAME_EMAIL) as? String

        email?.let {
            IterableApi.getInstance().setEmail(it)
            IterableApi.getInstance().registerForPush()
            result.success(null)
        } ?: run {
            result.error("error","invalid email", null)
        }
    }

    private fun disablePush(result: Result) {
        IterableApi.getInstance().disablePush()
        result.success(null)
    }

    override fun onNewIntent(intent: Intent): Boolean {
        return handleIntent(intent)
    }

    private fun handleIntent(intent: Intent?): Boolean {
        if (intent != null) {
            val extras = intent.extras
            val uri = extras?.getString("uri")

            if (extras != null && uri != null) {
                return IterableApi.getInstance().handleAppLink(uri)
            }
        }
        return false
    }
}
