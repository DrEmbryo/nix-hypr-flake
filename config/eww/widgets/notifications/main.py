import dbus
import dbus.service
from dbus.mainloop.glib import DBusGMainLoop
from gi.repository import GLib
import threading
import time

class Notification:
    def __init__(self, summary, body):
        self.summary = summary
        self.body = body

notifications = []

def remove_object(notif):
    time.sleep(10)
    notifications.remove(notif)
    print_state()

def add_object(notif):
    notifications.insert(0, notif)
    print_state()
    timer_thread = threading.Thread(target=remove_object, args=(notif,))
    timer_thread.start()

def print_state():
    templates = []
    for item in notifications:
        template = f"""
            (box :class 'notif'
                (box :orientation 'vertical'
                    (label :width 300 :wrap true :text '{item.summary or ''}')
                    (label :width 300 :wrap true :text '{item.body or ''}')
                )
            )
            """.replace('\n', '')
        templates.append(template)   
    print(rf"""(box :orientation 'vertical' {''.join(templates)})""", flush=True)

class NotificationServer(dbus.service.Object):
    def __init__(self):
        bus_name = dbus.service.BusName('org.freedesktop.Notifications', bus=dbus.SessionBus())
        dbus.service.Object.__init__(self, bus_name, '/org/freedesktop/Notifications')

    @dbus.service.method('org.freedesktop.Notifications', in_signature='susssasa{ss}i', out_signature='u')
    def Notify(self, app_name, replaces_id, app_icon, summary, body, actions, hints, timeout):
        add_object(Notification(summary, body))
        return 0

    @dbus.service.method('org.freedesktop.Notifications', out_signature='ssss')
    def GetServerInformation(self):
        return ("Custom Notification Server", "ExampleNS", "1.0", "1.2")

DBusGMainLoop(set_as_default=True)

if __name__ == '__main__':
    server = NotificationServer()
    mainloop = GLib.MainLoop()
    mainloop.run()