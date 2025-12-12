# Ultrasonic Radar System (Arduino + Processing)

This project implements a real-time **ultrasonic radar scanner** using an **Arduino UNO**, an **HC-SR04 ultrasonic sensor**, and an **SG90 servo motor**, with graphical visualization created in **Processing**.  
The system continuously sweeps between **15° and 165°**, detects objects within range, and displays them on a radar-like interface.

---

## 📦 Requirements

### ✅ Hardware
- Arduino UNO (recommended)
- HC-SR04 Ultrasonic Sensor
- SG90 Micro Servo Motor
- Jumper Wires
- USB Type-B Cable
- Optional: Breadboard

### ✅ Software / IDEs
You must install the following:

#### **1. Arduino IDE**
- Version recommended: **Arduino IDE 1.8.x or 2.x**

Used for:
- Uploading the `.ino` file
- Monitoring serial output

#### **2. Processing IDE**
- Version recommended: **Processing 3.x or 4.x**

Used for:
- Running radar visualization (.pde file)
- Communicating with Arduino via serial port

---

## 🧩 Hardware Wiring

| Component           | Arduino Pin |
|--------------------|-------------|
| HC-SR04 Trig       | 4 |
| HC-SR04 Echo       | 3 |
| SG90 Servo Signal  | 9 |
| VCC                | 5V |
| GND                | GND |

Make sure:
- The Echo pin uses a **digital input pin** (works on pin 3)
- Servo motor ground **must be shared** with Arduino’s ground

---



