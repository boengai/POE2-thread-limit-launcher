# POE2-Thread-Limit-Launcher

Simplified steps to prevent your machine from crashing when Path of Exile 2 crashes:

---

## **Step 1: Copy `.bat` File to Game Path in Steam Library**
- Download or clone this repo.
- Manually copy the `.bat` file to your Path of Exile 2 folder in your Steam library.
  - Example path: `<SteamLibraryPath>/steamapps/common/Path of Exile 2`

---

## **Step 2: Open the `.bat` File in a Text Editor**
- Open the `.bat` file using a text editor, such as Notepad.
- The original script contains the following lines with default affinity_value for 80% of 16 threads (logical processors):
- Setup your game_path to the `PathOfExileSteam.exe`

Example:
```bat
@echo off

:: Define variables
set "game_path=C:\Program Files (x86)\Steam\steamapps\common\Path of Exile 2\PathOfExileSteam.exe"
set "affinity_value=0xFFF0"

...
```

---

## **Step 3: Calculate Your CPU Hex Value**

*Note: You can skip this step if you are familiar with setting CPU affinity values.*

1. Open **Task Manager**.
2. Go to the **Performance** tab.
3. Click on **CPU** to see the number of **Logical Processors** displayed on the right.
4. Decide what percentage of threads you want to use for the game. For example:
   - If your CPU has 8 threads and you want the game to use 80%, you need 6 threads.
5. Use binary to represent active threads:
   - For 6 threads, write `1111 1100`.
6. Convert the binary value to hexadecimal:
   - `1111 1100` becomes `0xFC`.

Use this hex value in your `.bat` file by replacing the value of `affinity_value` to set CPU affinity.

---

## **Step 4: Adjust CPU Threads**
Use the table to decide how many threads to allocate.
Then set the `ProcessorAffinity` value in the `.bat` file by replacing `YOUR_HEX_VALUE` with your calculated hex value.

Example:
```bat
...
set "affinity_value=YOUR_HEX_VALUE"
...
```

### **Thread Allocation Table**
| Spec                   | 90% Threads        | 80% Threads        | 70% Threads        |
| ---------------------- | ------------------ | ------------------ | ------------------ |
| 4 Cores / 8 Threads    | 0xFE               | 0xFC               | 0xF8               |
| 6 Cores / 12 Threads   | 0xFFC              | 0xFF8              | 0xFF0              |
| 8 Cores / 16 Threads   | 0xFFFC             | 0xFFF0             | 0xFFE0             |
| 12 Cores / 24 Threads  | 0xFFFFF8           | 0xFFFFE0           | 0xFFFF00           |
| 16 Cores / 32 Threads  | 0xFFFFFFF0         | 0xFFFFFF80         | 0xFFFFFC00         |
| 24 Cores / 48 Threads  | 0xFFFFFFFE0        | 0xFFFFFFC00        | 0xFFFFF800         |
| 32 Cores / 64 Threads  | 0xFFFFFFFFFC       | 0xFFFFFFFFF0       | 0xFFFFFFFFE0       |
| 48 Cores / 96 Threads  | 0xFFFFFFFFFFF8     | 0xFFFFFFFFFFE0     | 0xFFFFFFFFFFC0     |
| 64 Cores / 128 Threads | 0xFFFFFFFFFFFFFFF0 | 0xFFFFFFFFFFFFFF80 | 0xFFFFFFFFFFFFFC00 |

---

## **Step 5: Create Shortcut**
- Save the `.bat` file.
- Right-click it and select **Create Shortcut**.
- In **Properties** > **Advanced**, check **Run as administrator**.

---

## **Step 6: Check CPU Usage**
- Launch Path of Exile 2 using the shortcut.
- Open **Task Manager** > **Details** tab.
- Find `PathOfExile2.exe`.
- Right-click and select **Set Affinity** to see which cores are in use.

---

Enjoy optimized gameplay!

