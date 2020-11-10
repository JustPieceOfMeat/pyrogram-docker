from os import environ
from pyrogram import Client


app = Client(
	f"sessions/{environ.get('SESSION_NAME') or 'my_account'}",
	environ.get('API_ID'),
	environ.get('API_HASH')
)

app.run()