#! /usr/bin/env python

session_names = []
while True:
    try:
        session_names.append(input())
    except EOFError:
        break

session_names = [name.split(":")[0] for name in session_names]

popup_sessions = [name for name in session_names if name.startswith("popup-")]
regular_sessions = [name for name in session_names if not name.startswith("popup-")]

dangling_popup_sessions = [
    name for name in popup_sessions if name[6:] not in regular_sessions
]

print("\n".join(dangling_popup_sessions))
