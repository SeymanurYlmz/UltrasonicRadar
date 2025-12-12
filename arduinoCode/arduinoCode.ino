#include <Servo.h>

const int trigPin = 4;
const int echoPin = 3;

long duration;
int distance;
Servo myServo;

void setup() {
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  Serial.begin(9600); // Baud rate 9600 olmalı
  myServo.attach(9);
}

void loop() {
  // Servo 15° -> 165° arası tarama
  for (int i = 15; i <= 165; i++) {
    myServo.write(i);
    delay(30); // Servo hareketi için bekle
    distance = calculateDistance();
    Serial.print(i);        // Açı
    Serial.print(",");
    Serial.println(distance); // Mesafe ve yeni satır
  }

  // Servo 165° -> 15° geri tarama
  for (int i = 165; i >= 15; i--) {
    myServo.write(i);
    delay(30);
    distance = calculateDistance();
    Serial.print(i);
    Serial.print(",");
    Serial.println(distance);
  }
}

// HC-SR04 mesafe ölçümü
int calculateDistance() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH); // Sinyalin gelme süresi
  distance = duration * 0.034 / 2;   // cm cinsine çevir
  return distance;
}
