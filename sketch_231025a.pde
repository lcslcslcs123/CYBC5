import processing.pdf.*;
PImage img;

int t=0;
float[] x=new float[800];
Curve[] curves;

boolean savePDF;

void setup() {
  size(800, 800);
  background(248);
  curves = new Curve[1600];
  img=loadImage("whiteHairLady.png");
  img.resize(width, height);

  for (int i=0; i<curves.length; i++) {
    PVector fP = new PVector(i*0.5, 0);
    curves[i] = new Curve(fP);
  }
}

void draw() {
  frameRate(100);
  background(248);
  image(img, 0, 0, width, height);
  for (int i=0; i<curves.length; i+=1) {

    float xPre = curves[i].cvt.get(curves[i].cvt.size()-1).x;
    float xNow = xPre += noise(i*.05, t*.01)*.5-0.24;
    PVector cv = new PVector(xNow, t);
    curves[i].cvt.add(cv);
  }

  t++;

  if (savePDF) {
    beginRecord(PDF, "curves.pdf");
  }

  for (Curve c : curves) {
    c.drawCurve();
  }

  if (savePDF) {
    endRecord();
    savePDF = false;
  }
}

void keyPressed() {
  if (key == 'p') savePDF=true;
}
