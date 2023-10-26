class Curve {
  ArrayList<PVector> cvt;

  Curve(PVector cv) {
    cvt = new ArrayList<PVector>();

    cvt.add(cv);
  }

  void drawCurve() {
    //noFill();
    //stroke(0,51);
    //strokeWeight(1);
    //beginShape();
    //for(int i = 0; i < cvt.size(); i++){
    //  vertex(cvt.get(i).x, cvt.get(i).y);
    //}
    //endShape();

    noFill();
    strokeWeight(1);
    float imgBrightness;
    for (int i = 0; i < cvt.size()-1; i++) {
      if(i%2==0){
       imgBrightness = brightness(img.pixels[floor(cvt.get(i).y)*img.width + floor(cvt.get(i).x)]);
      }else{
      imgBrightness=0.5*(brightness(img.pixels[floor(cvt.get(i-1).y)*img.width + floor(cvt.get(i-1).x)])+brightness(img.pixels[floor(cvt.get(i+1).y)*img.width + floor(cvt.get(i+1).x)]));
      }
      if (imgBrightness> 248) { //如果源图该处名都大于248，则绘制的线条颜色为黑色透明
        stroke(0, 81);
      } else {
        stroke(imgBrightness);//除此之外，绘制的线条颜色为源图颜色，会看不见
      }

      line(cvt.get(i).x, cvt.get(i).y, cvt.get(i+1).x, cvt.get(i+1).y);
    }
  }
}
