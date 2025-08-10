#!/usr/bin/env python3
"""
Simple Hello World Application for Testing
"""

import tkinter as tk
from tkinter import ttk
import sys

def main():
    # Create the main window
    root = tk.Tk()
    root.title("Hello World - ARIA Test")
    root.geometry("400x300")
    root.resizable(False, False)
    
    # Center the window
    root.eval('tk::PlaceWindow . center')
    
    # Create main frame
    main_frame = ttk.Frame(root, padding="20")
    main_frame.pack(fill=tk.BOTH, expand=True)
    
    # Title label
    title_label = ttk.Label(
        main_frame, 
        text="🚀 ARIA Hello World", 
        font=("Arial", 20, "bold"),
        foreground="#2E86AB"
    )
    title_label.pack(pady=(0, 20))
    
    # Hello message
    hello_label = ttk.Label(
        main_frame,
        text="Hello, World! 🌍",
        font=("Arial", 16),
        foreground="#A23B72"
    )
    hello_label.pack(pady=(0, 10))
    
    # Info message
    info_label = ttk.Label(
        main_frame,
        text="This is a test build for ARIA AI Agent",
        font=("Arial", 12),
        foreground="#F18F01"
    )
    info_label.pack(pady=(0, 20))
    
    # Python version info
    version_label = ttk.Label(
        main_frame,
        text=f"Python Version: {sys.version.split()[0]}",
        font=("Arial", 10),
        foreground="#C73E1D"
    )
    version_label.pack(pady=(0, 20))
    
    # Click counter
    click_count = tk.IntVar()
    
    def on_button_click():
        click_count.set(click_count.get() + 1)
        if click_count.get() == 1:
            count_label.config(text="Button clicked 1 time! 👆")
        else:
            count_label.config(text=f"Button clicked {click_count.get()} times! 🎉")
    
    # Test button
    test_button = ttk.Button(
        main_frame,
        text="Click Me! 🖱️",
        command=on_button_click,
        width=20
    )
    test_button.pack(pady=(0, 10))
    
    # Click counter label
    count_label = ttk.Label(
        main_frame,
        text="Click the button to test! 😊",
        font=("Arial", 11),
        foreground="#3A86FF"
    )
    count_label.pack(pady=(0, 20))
    
    # Exit button
    exit_button = ttk.Button(
        main_frame,
        text="Exit 🚪",
        command=root.quit,
        width=20
    )
    exit_button.pack()
    
    # Status bar
    status_frame = ttk.Frame(root)
    status_frame.pack(fill=tk.X, side=tk.BOTTOM)
    
    status_label = ttk.Label(
        status_frame,
        text="✅ ARIA Test Build - Ready",
        relief=tk.SUNKEN,
        anchor=tk.W,
        font=("Arial", 9)
    )
    status_label.pack(fill=tk.X, padx=5, pady=2)
    
    print("🚀 ARIA Hello World Test Application Started!")
    print("✅ Window created successfully")
    print("🔧 Ready for user interaction")
    
    # Start the GUI event loop
    try:
        root.mainloop()
    except KeyboardInterrupt:
        print("\n❌ Application terminated by user")
    finally:
        print("👋 ARIA Hello World Test Application Closed!")

if __name__ == "__main__":
    print("=" * 50)
    print("🎯 Starting ARIA Hello World Test")
    print("=" * 50)
    main()
