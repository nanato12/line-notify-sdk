from notify import Notify

n = Notify(token="YOUR_NOTIFY_TOKEN")
r = n.send_text("hello")

print(r.json())
