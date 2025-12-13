import processing.serial.*;


Serial myPort; 


String data = ""; 
String angle = ""; 
String distance = ""; 
String noObject = "In Range"; 

int iAngle = 0; 
int iDistance = 0; 
float pixDistance = 0; 

int maxMesafe = 200; // cm

void setup() {
  size(1366, 700); 
  smooth();
  
  println(Serial.list()); 
  myPort = new Serial(this, "COM6", 9600); // Check the COM port
  myPort.bufferUntil('\n');
}

void draw() {
  
  fill(0, 4); 
  rect(0, 0, width, height);
  
  drawRadar();
  drawLines();
  drawText();
  drawObject();
}


void serialEvent(Serial myPort) {
  data = myPort.readStringUntil('\n');
  if (data != null) {
    data = trim(data);
    println("Gelen veri: " + data); 
    
    String[] bolunmusVeri = split(data, ',');
    
    if (bolunmusVeri.length == 2) {
      try {
        iAngle = Integer.parseInt(bolunmusVeri[0].trim());
        iDistance = Integer.parseInt(bolunmusVeri[1].trim());
      } catch (Exception e) {
        println("Parse hatası: " + data);
        iAngle = 0;
        iDistance = maxMesafe + 1;
      }
    }
  }
}


void drawRadar() {
  pushMatrix();
  translate(width / 2, height);
  
  noFill();
  strokeWeight(2);
  stroke(98, 245, 31);
  
  arc(0, 0, 1300, 1300, PI, TWO_PI); 
  arc(0, 0, 1000, 1000, PI, TWO_PI); 
  arc(0, 0, 700, 700, PI, TWO_PI); 
  arc(0, 0, 400, 400, PI, TWO_PI); 

  strokeWeight(1);
  line(0, 0, -cos(radians(30)) * height, -sin(radians(30)) * height);
  line(0, 0, -cos(radians(60)) * height, -sin(radians(60)) * height);
  line(0, 0, -cos(radians(90)) * height, -sin(radians(90)) * height);
  line(0, 0, -cos(radians(120)) * height, -sin(radians(120)) * height);
  line(0, 0, -cos(radians(150)) * height, -sin(radians(150)) * height);
  
  popMatrix();
}


void drawLines() {
  pushMatrix();
  translate(width / 2, height);
  
  strokeWeight(9);
  stroke(39, 250, 60);
  
  line(0, 0, -cos(radians(iAngle)) * height, -sin(radians(iAngle)) * height);
  
  popMatrix();
}


void drawObject() {
  pushMatrix();
  translate(width / 2, height);
  
  stroke(255, 10, 10);
  strokeWeight(9);
  
  pixDistance = iDistance * 3.25; 
  
  if (iDistance < maxMesafe) {
    float obj_x = -cos(radians(iAngle)) * pixDistance;
    float obj_y = -sin(radians(iAngle)) * pixDistance;
    
    fill(255, 0, 0);
    ellipse(obj_x, obj_y, 10, 10); 
    noObject = "Nesne Algılandı";
  } else {
    noObject = "Menzil Dışı";
  }
  
  popMatrix();
}


void drawText() {
  pushMatrix();
  
  fill(0, 0, 0, 100); 
  noStroke();
  rect(1000, 0, 500, height);
  
  fill(98, 245, 31);
  textSize(25);
  text("20cm", 750, 690);
  text("40cm", 950, 690);
  text("60cm", 1100, 690);
  text("80cm", 1250, 690);
  
  textSize(40);
  text("Nesne Durumu: " + noObject, 1050, 80);
  text("Açı: " + iAngle + "°", 1050, 130);
  
  if (iDistance < maxMesafe) {
    text("Mesafe: " + iDistance + " cm", 1050, 180);
  } else {
    text("Mesafe: Çok Uzak", 1050, 180);
  }

  textSize(25);
  translate(width / 2, height);
  
  text("30°", -300, -500);
  text("60°", -100, -600);
  text("90°", -10, -600);
  text("120°", 100, -600);
  text("150°", 300, -500);
  
  popMatrix();
}

