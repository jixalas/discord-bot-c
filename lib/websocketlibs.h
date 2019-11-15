static const struct lws_extension extensions[] = {
	{
		"permessage-deflate",
		lws_extension_callback_pm_deflate,
		"permessage-deflate; client_max_window_bits"
	},
	{
		"deflate-frame",
		lws_extension_callback_pm_deflate,
		"deflate_frame"
	},
	{ NULL, NULL, NULL } // Always needed at the end
};
static struct lws_protocols protocols[] = {
	{
		"test-protocol", // Protocol name
		callback_test,   // Protocol callback
		0,				 // Data size per session (can be left empty)
		512,			 // Receive buffer size (can be left empty)

	},
	{ NULL, NULL, 0 } // Always needed at the end
};
static void onSigInt(int sig);
int test();
static int callback_test(struct lws* wsi, enum lws_callback_reasons reason, void *user, void* in, size_t len)