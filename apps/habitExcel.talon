app: excel
app: Microsoft Excel
-

go today: user.go_today()
yes: 
    insert('1')
    key('tab')
no: 
    insert('')
    key('tab')
fail: 
    insert('0')
    key('tab')

# play noise
test script: user.go_to_current_date_row("C:\\Users\\rebec\\Dropbox\\DropboxDocuments\\notes\\habit_tracker.xlsx",'Sheet', 'LegEx')
mark wrist: user.go_column("WristEx")
mark hand: user.go_column("HandEx")
mark top: user.go_column("TopStretch")
mark top move: user.go_column("TopMove")
mark leg: user.go_column("LegEx")
mark ankle: user.go_column("AnkleEx")
mark lower: user.go_column("LowerStretch")
mark lower move: user.go_column("LowerMove")
mark psoas: user.go_column("Psoas")
mark walk: user.go_column("Walk")
mark cardio: user.go_column("Cardio")
mark one: user.go_column("One")
mark wake : user.go_column("WakeTime")
mark work: user.go_column("Work")
mark tired: user.go_column("Tired")
mark stress: user.go_column("Stress")
mark mood: user.go_column("Mood")

bounce <number_small>:
    insert(number_small)
    key(enter)
