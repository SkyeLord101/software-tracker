import tkinter as tk
from tkinter import messagebox

# Sample software usage data
software_data = {
    9: {"Chrome": 15, "Visual Studio Code": 10, "Excel": 5},
    10: {"Chrome": 20, "Visual Studio Code": 8, "Word": 6},
}

# Function to display the top 10 software for a given hour
def show_top_software(hour):
    top_software = software_data.get(hour, {})
    if top_software:
        messagebox.showinfo("Top Software for Hour {}".format(hour), "\n".join(top_software.keys()))
    else:
        messagebox.showinfo("No Data", "No software data available for hour {}".format(hour))

# Create the main window
window = tk.Tk()
window.title("Software Usage Tracker")

# Create a label to display the software data
label = tk.Label(window, text="Software Usage Data:")
label.pack()

# Create buttons for each hour to display the top software
for hour in range(0, 24):
    button = tk.Button(window, text=str(hour), command=lambda h=hour: show_top_software(h))
    button.pack(side=tk.LEFT)

# Run the UI loop
window.mainloop()
